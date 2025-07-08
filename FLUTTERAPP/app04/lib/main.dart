
  import 'package:flutter/material.dart';
  void main(List<String> args) {
    runApp(Principal());
  }
  class Principal extends StatelessWidget {
    const Principal({super.key});
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: "INFORMACIÓN PERSONAL",
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 100, 15, 0),
            title: Text("INFORMACIÓN PERSONAL"),
          ),
          body: Column(
            children: [
              Text("Aprendiz"),
              Text("Michael Vasquez"),
              Icon(Icons.phone_android_outlined),
              Icon(Icons.ad_units_sharp),
              ElevatedButton(onPressed: (){}, child: Text("Insert")),
              ElevatedButton(onPressed: (){}, child: Text("Update")),
              ElevatedButton(onPressed: (){}, child: Text("Save")),
            ],
          ),
        ),
      );
    }
  }