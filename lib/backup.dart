// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:water_monitoring_app/Screens/Home_screen.dart';
// import 'package:water_monitoring_app/main.dart';
// import 'package:water_monitoring_app/progressIndicator.dart';
// import 'Screens/Home_screen.dart';
// import 'package:logger/logger.dart';
// import 'Screens/TankSize_screen.dart';

// class TanksArrangement extends StatefulWidget {
  
  
//   TanksArrangement({ super.key});

//   @override
//   State<TanksArrangement> createState() => _TanksArrangementState();
// }

// class _TanksArrangementState extends State<TanksArrangement> {

 
//   @override
//   Widget build(BuildContext context) {

//     final myData = context.watch<MyData>(); 
//      Color getColour(int index){
//       if (index == myData.NumOfTank){
//         return Colors.amber.shade400.withOpacity(0.5);
//       } else if(index < myData.TankValues.length) {
//             if(myData.TankValues.elementAt(index) > 0.7){
//               return Colors.green.shade800;
//             } else if(myData.TankValues.elementAt(index) <= 0.15){
//               return Colors.red.shade800;
//             } else if(myData.TankValues.elementAt(index) <= 0.3 && myData.TankValues.elementAt(index) > 0.15 ){
//                return Colors.yellow.shade800;
//              } 
//       }
//     return Colors.grey.shade600;                                                                                                              
 
// }


//        return Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//          children: [
//            Expanded(
//              child: ListView.builder(
                 
//               itemCount: myData.NumOfTank,
//               itemBuilder: (context, index) {
//                   return Consumer<MyData>(
//                builder: ((context, value, child) {
//                  if (index < value.NumOfTank){
//                     if(myData.TankValues.isEmpty){
//                          List <double> placeholder = [for(var i = 0; i < value.NumOfTank; i++ ) 0.0];
//                          context.read<MyData>().updateTankValues(placeholder);
//                      }
//                    else if (myData.TankValues.length < value.NumOfTank){
//                         num val = value.NumOfTank - myData.TankValues.length;
//                         List <double> val_ = [for(var i = 0; i < val; i++) 0.0];
//                         List <double> placeholder = myData.TankValues;
//                         placeholder.addAll(val_);
//                         context.read<MyData>().updateTankValues(placeholder);
//                       }
                
//                     return Container(
//                             width: 300,
//                             height: 400,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                              color: getColour(index),
//                           ),
                         
//                          child: InkWell(
//                         child: LiquidProgress(
//                           value: myData.TankValues.elementAt(index) , direction: Axis.vertical,backgroundColor: Colors.orangeAccent
//                           ),
//                           onLongPress: () {
//                             showModalBottomSheet(
//                               context: context, 
//                               builder: (BuildContext context){
//                                 return Container(
//                             width: 300,
//                             height: 200,
//                                   child: Column(
//                                     children: [
//                                       ListTile(title: Text("Tank" + index.toString()) ,),
//                                       ListTile(title: Text('Tank Size'), 
//                                       onTap: (){
//                                         Navigator.push(context,
//                                         MaterialPageRoute(
//                                           builder: (context) => tankSize(Tank_index: index),
//                                           )
//                                           );
//                                        },),
//                                     ],
//                                   ),
//                                 );
//                               });
//                           }
//                       ),
//                       );
//                 } return Card();
//                     }),
//                );
//               },
              
                
//                ),
//            ),
        
//         SizedBox(height: 20.0,),

//         Container(
//                       width: 300,
//                       height: 400,
//                  decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                    color: Colors.grey.shade600,
//                   ),
                 
//                  child: Center (
//                 child: IconButton(
//                   onPressed: (){
//                             context.read<MyData>().updateNumOfTank(myData.NumOfTank + 1);  
//                   },
//               iconSize: 200,
//                icon: Icon(Icons.add_box_rounded, color: Colors.white,),
//                color: Colors.grey.shade600,
               
//                ),
               
//                ) ,
//               ),
//          ],
//        );
 



//   }

//   }