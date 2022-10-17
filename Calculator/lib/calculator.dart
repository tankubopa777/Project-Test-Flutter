import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userinput = "";
  String result = "0";

  List<String> buttonList = [
    "C","(",")","/",
    "7","8","9","*",
    "4","5","6","+",
    "1","2","3","-",
    "AC","0",".","=",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Flexible(child: resulwidget(), flex: 1),
            Flexible(child: buttonwidget(), flex: 3),
          ],
        ),
      ),
    );
  }
 //Manage resul
  Widget resulwidget() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            userinput,
            style: TextStyle(fontSize: 32,color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: TextStyle(fontSize: 48,color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget buttonwidget() {
    return GridView.builder(
        itemCount: buttonList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return button(buttonList[index]);
        });
  }

  Widget button(String text) {
    return Container(
        margin:  const EdgeInsets.all(8),
        child : MaterialButton(
        onPressed: () {
          setState(() {
            buttonpress(text);
          });
        },
        color: getColor(text),
        textColor: Colors.white,
        child: Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
        shape: const CircleBorder(),
      ),
    );
  }
  //Button function
   buttonpress(String text){
    if(text == "AC"){
      userinput = "";
      result = "0";
      return;
    }
    if(text== "="){
      result = calculate();
      
      if(result.endsWith(".0"))
        result = result.replaceAll(".0", "");
        return;
    }
    userinput = userinput + text;
   }
  // Calculate
  String calculate(){
    try{
      var exp = Parser().parse(userinput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    }catch(e){
      return "Error";
    }

  }
  //Button Color
  getColor(String text){
    if(text == "/" || text == "*" || text == "+" || text == "-"){
      return Colors.orange.shade300;
    }
    else if(text == "C" || text == "AC"){
      return Colors.blue;
    }
    else if(text == "(" || text == ")"){
      return Colors.red;
    }
    else if(text == "="){
      return Colors.pink.shade200;
    } 
    return Colors.green;
  }
}
