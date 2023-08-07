// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

 class MyData{
  int numOfTank = 0;
  List <double> tankValues = [];
  String pumpState = '';

MyData({
required this.numOfTank,
required this.tankValues,
required this.pumpState,
});
  MyData updateNumOfTank(int numOfTank){
    return MyData(
      numOfTank: numOfTank,
      pumpState: this.pumpState,
      tankValues: this.tankValues,
    );
  }

   MyData updateTankValues(List <double> tankValues){
    return MyData(
      numOfTank: this.numOfTank,
      pumpState: this.pumpState,
      tankValues: tankValues,
    );
  }

    MyData updatePumpState(String pumpState){
    return MyData(
      numOfTank: this.numOfTank,
      pumpState: pumpState,
      tankValues: this.tankValues,
    );
  }
}