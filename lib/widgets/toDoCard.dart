import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  String text;
  bool doOrNot;
  
  ToDoCard({
    required this.text,
    required this.doOrNot,
  });

  @override
  Widget build(BuildContext context) {
    return  FractionallySizedBox(
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
                    color: doOrNot ? Colors.green[600] : Colors.red,
                    size: 27,
                  ),
                ],
              )),
        );

  }
}

// Container(
//           margin: EdgeInsets.all(22),
//           color: Color.fromARGB(255, 238, 181, 8),
//           height: 300,
//           alignment: Alignment.center,
//           child: ListView.builder(

//               itemCount: 3,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   alignment: Alignment.center,
//                   height: 150,
//                   color: Colors.amber[degee_of_color[index]],
//                   child: Text(text[index]),
//                 );
//               }),
//         ),
