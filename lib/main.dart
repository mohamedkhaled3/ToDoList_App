import 'package:flutter/material.dart';
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
    Task(title: "go gym", stutus: false),
    Task(title: "go out", stutus: false),
  ];
  

  void addNewTask() {
    setState(() {
      all_tasks.add(
        Task(title: myControler.text, stutus: false),
      );
    });
  }

  ///////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(22),
                  color: Colors.amber[100],
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
                );
              },
              // to make second screen full screen
              isScrollControlled: true);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
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
            // text is var.
            ...all_tasks.map((item) => ToDoCard(
                  text: item.title,
                  doOrNot: item.stutus,
                ))
          ],
        ),
      ),
    );
  }
}
