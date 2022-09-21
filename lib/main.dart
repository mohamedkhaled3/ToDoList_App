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

class _HandleState extends State<Handle> {
  //////////////////////////////////////////////dart
  
  ///////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        appBar: AppBar(
          elevation: 0, // shadow
            backgroundColor: Color.fromRGBO(58, 66, 86, 1),
          title:  Text(
            "TO DO APP",
            style: TextStyle(color: Colors.white, fontSize: 33 , fontWeight: FontWeight.bold),
          ),      
        ),

        body: Container( 
          width: double.infinity,
          child: Column(
            children: [
                ToDoCard(),
                ToDoCard(),
                ToDoCard(),    
  
            ],
          ),
        ),  

        );
  }
}
