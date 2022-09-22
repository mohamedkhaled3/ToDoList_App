import 'package:flutter/material.dart';
import 'package:test_flutter/widgets/counter.dart';
import 'package:test_flutter/widgets/to_do_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Handle(),
    );
  }
}

class Handle extends StatefulWidget {
  const Handle({Key? key}) : super(key: key);

  @override
  State<Handle> createState() => _HandleState();
}

class Task {
  String title;
  bool stutus;

  Task({
    required this.title,
    required this.stutus,
  });
}

class _HandleState extends State<Handle> {
  //////////////////////////////////////////////dart
  final myControler = TextEditingController();

  List all_tasks = [
    Task(title: "study", stutus: true),
    Task(title: "launch", stutus: true),
    Task(title: "go gym", stutus: true),
    Task(title: "go out", stutus: true),
  ];

  void addNewTask() {
    setState(() {
      all_tasks.add(
        Task(title: myControler.text, stutus: false),
      );
    });
  }

  int calculateCompleteTasks() {
    int completeTasks = 0;

    all_tasks.forEach((item) {
      if (item.stutus) {
        completeTasks++;
      }
    });

    return completeTasks;
  }



  ///////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  // decoration: BoxDecoration(   error
                  // borderRadius: BorderRadius.circular(22) ),
                  height: 200,
                  padding: EdgeInsets.all(22),
                  // color: Colors.amber[100], dont use
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myControler,
                        maxLength: 20,
                        decoration: InputDecoration(hintText: "write new todo"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          addNewTask(); //
                        }, //Return to the first screen
                        child: Text(
                          "Add",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            // to make second screen full screen
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      appBar: AppBar(
        elevation: 0, // shadow
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              ToDoCounter(
                  calculateCompleteTasksFunction: calculateCompleteTasks(),
                  all_tasks_length: all_tasks.length,
                  ),
              // text is var.
              ...all_tasks.map((item) => ToDoCard(
                    text: item.title,
                    doOrNot: item.stutus,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
