import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Screens/Home_screen.dart';
import 'package:web_socket_channel/io.dart';
import 'Messages.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:io';


void main(){runApp(
  const MyApp());
}
const url = 'https://blesezwaterproj.onrender.com?token:App';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  FutureBuilder<WebSocketChannel>(
          future: connectToWS(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
                    Messages(channel: snapshot.data!);
              return HomeScreen(channel: snapshot.data!);
              
            } else if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      );
    
  }

 Future<WebSocketChannel> connectToWS(BuildContext context) async {
  try {
    final channel = IOWebSocketChannel(await WebSocket.connect('$url:10000'));
    // websocket connection successful, handle further actions here
    return channel;
  } on SocketException catch (e) {
    if (e.osError?.errorCode == 111) {
       
      throw Exception(showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to connect to the server'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        ),);
     
    } else {
      debugPrint("unexpected socket exception: $e");
      
      throw Exception(
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to connect to the server'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      );
    }
  } catch (e) {
    if (kDebugMode) {
      print('unexpected exception: $e');
    }
    throw Exception('Unexpected exception');
  }
}


}




