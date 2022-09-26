import 'package:flutter/material.dart';
import 'package:test_flutter/widgets/counter.dart';
import 'package:test_flutter/widgets/toDoCard.dart';

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
  bool status;

  Task({
    required this.title,
    required this.status,
  });
}

class _HandleState extends State<Handle> {
  //////////////////////////////////////////////dart
  final myControler = TextEditingController();

  List all_tasks = [
    Task(title: "study", status: true),
    Task(title: "launch", status: true),
    Task(title: "go gym", status: true),
    Task(title: "go out", status: true),
  ];
  deleteAll() {
    setState(() {
      all_tasks.removeRange(0, all_tasks.length);
    });
  }

  delete(int index) {
    setState(() {
      all_tasks.remove(all_tasks[index]);
    });
  }

  changeState(int index) {
    setState(() {
      all_tasks[index].status = !all_tasks[index].status;
    });
  }

  void addNewTask() {
    setState(() {
      all_tasks.add(
        Task(title: myControler.text, status: false),
      );
    });
  }

  int calculateCompleteTasks() {
    int completeTasks = 0;

    all_tasks.forEach((item) {
      if (item.status) {
        completeTasks++;
      }
    });

    return completeTasks;
  }

  ///////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(174, 73, 79, 94),
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
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 37,
            color: Color.fromARGB(255, 248, 78, 66),
          )
        ],
        elevation: 0, // shadow
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            ToDoCounter(
              calculateCompleteTasksFunction: calculateCompleteTasks(),
              all_tasks_length: all_tasks.length,
            ),
            // text is var.
            Container(
              height: 400,
              color: Color.fromARGB(175, 174, 191, 236),
              child: ListView.builder(
                  itemCount: all_tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ToDoCard(
                      text: all_tasks[index].title,
                      doOrNot: all_tasks[index].status,
                      changeState: changeState,
                      index: index,
                      delete: delete,
                      // all_tasks_length : all_tasks.length ,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

            // old
            // ...all_tasks.map((item) => ToDoCard(
            //       text: item.title,
            //       doOrNot: item.status,
            //       // all_tasks_length : all_tasks.length ,
            //     )