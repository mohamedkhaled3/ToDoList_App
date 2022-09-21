import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  String text;
  bool doOrNot;
  ToDoCard({required this.text , required this.doOrNot ,});
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.amber,
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text, //
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),

              // SizedBox( width: 100, ),

              Icon(
               // Icons.close
              //  color: Colors.red,
                //condition ? If-True : If-False
                doOrNot ? Icons.check : Icons.close,       
                color: doOrNot ? Colors.green[600]: Colors.red,
                size: 27,
              ),
            ],
          )),
    );
  }
}
