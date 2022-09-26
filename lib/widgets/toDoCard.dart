import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  String text;
  bool doOrNot;
  Function changeState;
  int index;
  Function delete;
  

  ToDoCard({
    required this.text,
    required this.doOrNot,
    required this.changeState,
    required this.index,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeState(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
   
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Color.fromARGB(255, 88, 125, 132),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(22),
    
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text, //
                  style: TextStyle(
                  fontSize: 22,        
                  decoration: doOrNot ? TextDecoration.lineThrough:TextDecoration.none ,
                  color: doOrNot? Color.fromARGB(132, 0, 0, 0): Colors.white,
                          
                          
                  
                  ),
                ),

                // SizedBox( width: 100, ),

                Row(
                  children: [
                    Icon(
                      // Icons.close
                      //  color: Colors.red,
                      //condition ? If-True : If-False
                      doOrNot ? Icons.check : Icons.close,
                      color: doOrNot
                          ? Color.fromARGB(255, 32, 227, 42)
                          : Colors.red,
                      size: 27,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        delete(index);
                      },
                      icon: Icon(Icons.delete),
                      iconSize: 27,
                      color: Color.fromARGB(255, 248, 78, 66),
                    ),
                  ],
                ),
              ],
            )),
      ),
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
