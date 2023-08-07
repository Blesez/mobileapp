
import 'package:provider/provider.dart';
import 'package:water_monitoring_app/main.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:flutter/material.dart';

class LiquidProgress extends StatelessWidget {
  
  Color? backgroundColor;
  double value;
  Axis direction;

  LiquidProgress({
    required this.value,
    required this.direction,
    this.backgroundColor,
 });
  @override
  Widget build(BuildContext context) {
 
    return Padding(
          padding: const EdgeInsets.all(20.0),
          child: FittedBox(
           fit: BoxFit.contain,
            child: LiquidCustomProgressIndicator(
                value: value,
                backgroundColor: backgroundColor,
                valueColor:AlwaysStoppedAnimation(Colors.lightBlue.shade300),
                direction:direction,
                center: Text(
                  value.toString(), 
                style: const TextStyle(
                  fontSize: 150,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ) ), 
                shapePath: _buildTankPath(), ),
          ),
        );
      
  }


}

 Path _buildTankPath(){
    Path path = new Path(); 
    
    path.lineTo(0, 50);
    path.lineTo(200, 50);
    path.lineTo(200, 30);
    path.quadraticBezierTo(400,0,600, 30);
    path.lineTo(600, 50);
    path.lineTo(800,50);
    path.lineTo(800, 1170);
    path.lineTo(0,1170);
    path.close();
     return path;
   }