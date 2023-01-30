import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore,this.resetHandler);

  String get resultPhrase{
    String resultText;

    if(resultScore<=10){
      resultText = "You Are Inocent";
    }
    else if(resultScore<=15){
      resultText = "You Are Good";
    }
    else if (resultScore <= 20){
      resultText = "You Are Smart";
    }
    else{
      resultText = "You Are Brilient";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36,fontWeight:FontWeight.bold ),
          textAlign: TextAlign.center,
        ),
        TextButton(onPressed: resetHandler, child: Text("Restart"),),
      ],
    ));
  }
}
