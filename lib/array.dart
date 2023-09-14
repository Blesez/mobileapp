// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:water_monitoring_app/Screens/Home_screen.dart';
// import 'package:water_monitoring_app/main.dart';
// import 'package:water_monitoring_app/progressIndicator.dart';
// import 'Screens/Home_screen.dart';
// import 'Screens/TankSize_screen.dart';

// class TanksArrangement extends StatefulWidget {
//   const TanksArrangement({super.key});

//   @override
//   State<TanksArrangement> createState() => _TanksArrangementState();
// }

// class _TanksArrangementState extends State<TanksArrangement> {

//   @override
//   Widget build(BuildContext context) {
//   final myData = Provider.of<MyData>(context); 
 

//     List <String> myTanks = List.generate(myData.NumOfTank, ((index) {
//     // for (index;  index < NumOfTank; index++){
//       String obj = "Tank " + index.toString();
//       return obj;
//      //}
//     }),
//     growable: true);
//     if (myData.NumOfTank == 0){
//           return Container(
//             height: 50,
//             width: 50,
//             color: Colors.grey.shade500,
//       child: Center (
//         child: IconButton(onPressed: (){
//        setState((){
//         myData.NumOfTank = myData.NumOfTank + 1;
//        });
//       },
//        icon: Icon(Icons.add_box_rounded),
//        color: Colors.grey.shade600,
//        ),
       
//    ) 
//    );
//         }else {
//     return Expanded(

//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             GridView(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3, crossAxisSpacing: 10,mainAxisSpacing: 10, 
//             ),
//             children: List.generate(myTanks.length, (index) {
              
//               return  Container(
//                 color: getColour(),
//              child: Center(
//                child: InkWell (
//                     child: LiquidProgress(),
                    
                  
               
//                 onLongPress: () {
//                   showModalBottomSheet(
//                     context: context, 
//                     builder: (BuildContext context){
//                       return Container(
//                         height: 200.0,
//                         child: Column(
//                           children: [
//                             ListTile(title: Text("${myTanks.elementAt(index)}") ,),
//                             ListTile(title: Text('Tank Size'), onTap: (){ },),
//                           ],
//                         ),
//                       );
//                     });
//                 },
//                ),
//              ),
//              );
              
//             }),
            
//           ),
//              SizedBox(height: 2.0,),
//              Container(
//               height: 50,
//               width: 50,
//               color: Colors.grey.shade500,
//         child: Center (
//           child: IconButton(onPressed: (){
//          setState((){
//           myData.NumOfTank = myData.NumOfTank + 1;
//          });
//         },
//          icon: Icon(Icons.add_box_rounded, color: Colors.white,),
//          color: Colors.grey.shade600,
//          ),
         
//          ) ,
//          ),
//           ],
//         ),
//       ),
//     );
// }
//   }

// }

// Color getColour(){
//    if (VolumeOfWater > 0.7){
//      return Colors.green.shade800;
//   } else if(VolumeOfWater <= 0.15){
//     return Colors.red.shade800;
//   } else if(VolumeOfWater <= 0.3 && VolumeOfWater > 0.15 ){
//     return Colors.yellow.shade800;
//   } else{
//     return Colors.grey.shade600;
//   }
// }

