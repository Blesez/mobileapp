// ignore_for_file: non_constant_identifier_names


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
      pumpState: pumpState,
      tankValues: tankValues,
    );
  }

   MyData updateTankValues(List <double> tankValues){
    return MyData(
      numOfTank: numOfTank,
      pumpState: pumpState,
      tankValues: tankValues,
    );
  }

    MyData updatePumpState(String pumpState){
    return MyData(
      numOfTank: numOfTank,
      pumpState: pumpState,
      tankValues: tankValues,
    );
  }
}