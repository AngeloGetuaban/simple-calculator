import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _history = "";
  String _expression = "";
  String _percent = "/100";
  void numClick(String text) {
    setState(() => _expression += text);
  }

  void numClick2(String text) {
    setState(() => _expression += _percent);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = "";
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    _history,
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: TextStyle(fontSize: 48, color: Colors.black),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonCal(
                    text: "AC",
                    callback: allClear,
                  ),
                  ButtonCal(
                    text: "C",
                    callback: clear,
                  ),
                  ButtonCal(
                    text: "%",
                    callback: numClick2,
                  ),
                  ButtonCal(
                    text: "/",
                    callback: numClick,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonCal(
                    text: "7",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "8",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "9",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "*",
                    callback: numClick,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonCal(
                    text: "4",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "5",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "6",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "-",
                    textSize: 38,
                    callback: numClick,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonCal(
                    text: "1",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "2",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "3",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "+",
                    callback: numClick,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonCal(
                    text: ".",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "0",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "00",
                    callback: numClick,
                  ),
                  ButtonCal(
                    text: "=",
                    callback: evaluate,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
