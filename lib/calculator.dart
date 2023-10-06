import 'package:flutter/material.dart';
import 'calc_btn.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = "";

  onBtnClick(giventxt) {
    if(operation=="=")
      {
        operation="";
        lhs="";
        result="";
      }
    result += giventxt;
    setState(() {});
  }


  String operation = "";
  String lhs = "";

  onOperationClick(givenop) {
    if (operation.isEmpty) {
      lhs = result;
      operation = givenop;
    } else {
      String res = calculator(lhs, result, operation);
      lhs = res;
      operation = givenop;
    }
    result = "";
    print(lhs);
    setState(() {

    });
  }


  String calculator(String lhs, String rhs, String op) {
    double LHS = double.parse(lhs);
    double RHS = double.parse(rhs);
    double res = 0;
    if (op == "+") {
      res = LHS + RHS;
      return res.toString();
    } else if (op == "-") {
      res = LHS - RHS;
      return res.toString();
    } else if (op == "*") {
      res = LHS * RHS;
      return res.toString();
    } else if (op == "/") {
      res = LHS / RHS;
      return res.toString();
    }
    return "";
  }

  onEqualClick(givenEq)
  {
    result=calculator(lhs, result, operation);
    operation=givenEq;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("simple calculator")),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            result,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w200, color: Colors.brown),
          ),
        )),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalcButtton("7", onBtnClick),
              CalcButtton("8", onBtnClick),
              CalcButtton("9", onBtnClick),
              CalcButtton("/", onOperationClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalcButtton("4", onBtnClick),
              CalcButtton("5", onBtnClick),
              CalcButtton("6", onBtnClick),
              CalcButtton("*", onOperationClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalcButtton("1", onBtnClick),
              CalcButtton("2", onBtnClick),
              CalcButtton("3", onBtnClick),
              CalcButtton("+", onOperationClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalcButtton(".", onBtnClick),
              CalcButtton("0", onBtnClick),
              CalcButtton("=", onEqualClick),
              CalcButtton("-", onOperationClick),
            ],
          ),
        )
      ]),
    ));
  }
}
