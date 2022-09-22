import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ToDoCounter extends StatelessWidget {
  int calculateCompleteTasksFunction;
  int all_tasks_length;
 
  ToDoCounter(
      {required this.calculateCompleteTasksFunction,
      required this.all_tasks_length,
       });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "${calculateCompleteTasksFunction}/${all_tasks_length}",
        style: TextStyle(
            fontSize: 44 , color: calculateCompleteTasksFunction == all_tasks_length ? Colors.green[600] : Colors.white  , fontWeight: FontWeight.bold),

      ),
    );
  }
}
