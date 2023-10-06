import 'package:flutter/material.dart';

class CalcButtton extends StatelessWidget {
  String txt;
  Function onclick;

  CalcButtton(this.txt, this.onclick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              onclick(txt);
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.white))),
            child: Text(
              txt,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )));
  }
}
