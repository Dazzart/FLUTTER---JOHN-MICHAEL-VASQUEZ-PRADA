 import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp(Principal());  
}
class Principal extends StatelessWidget {
  const Principal({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ficha | 2925960",
      debugShowCheckedModeBanner: false,
      home: HomePrincipal(),
    );
  }
}
class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});
  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}
class _HomePrincipalState extends State<HomePrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 53, 209, 21),
        title: Text("Michael Vasquez"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(          
          itemCount: sitiosTuristicos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text(sitiosTuristicos[index]),
              ),
            );
          },
        ),
      ),      
    );
  }
}
List<String> sitiosTuristicos = [
  "Michael Vasquez",
  "Miguel Torres",
  "Jose Daza",
  "Jose Zabaleta",
  "David Meneses",
  "Alan Cadena",
  "Santiago Moralez",
  ];