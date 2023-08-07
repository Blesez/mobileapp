import 'package:water_monitoring_app/tankControl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';



class Messages extends StatefulWidget {
  final WebSocketChannel channel;
  const Messages({required this.channel, super.key, });

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late MyData myData;
  late StreamController<MyData> _streamController;

   @override
   void initState(){
    super.initState();
    myData = MyData(numOfTank: 0, tankValues: List.empty(), pumpState: '');
    _streamController = StreamController<MyData>.broadcast();
    widget.channel.stream.listen(
      (data) {
        try { 
      final message = jsonDecode(data);
      final List<double> tankValues = List <double>.from(message['val']);
      final pumpState = message['pumpState'];

      setState(() {
       myData = myData.updateTankValues(tankValues).updatePumpState(pumpState);
      });
      } catch (error){
        debugPrint('ws error $error');
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
        );
      }
    },
     onDone: (){
      debugPrint('ws channel closed');
    },
    );
   }
  @override
  void dispose(){
    widget.channel.sink.close();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MyData>(
       stream: _streamController.stream,
        builder: (BuildContext context,AsyncSnapshot<MyData> snapshot) {
            if(snapshot.hasData){
              final myData = snapshot.data!;
              int numOfTank = myData.numOfTank;
              widget.channel.sink.add(numOfTank);
              
              } 
              throw Exception("cant create widget");
                     },
                );
  }
  }

 