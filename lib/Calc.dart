import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var text) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {
          // jab bhi button pressed to result me text chala jaiga.
          setState(() {
            //result = text;
            result = result + text;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
          ),
        ));
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 10),
          Text(
            "Calculator",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 80),
          Text(
            result,
            style: TextStyle(
                fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 110),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("1"),
              btn("2"),
              btn("3"),
              btn("+"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("5"),
              btn("6"),
              btn("7"),
              btn("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("9"),
              btn("0"),
              btn("."),
              btn("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("/"),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: clear,
                  child: Text(
                    "CLEAR",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: output,
                  child: Text(
                    "=",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
