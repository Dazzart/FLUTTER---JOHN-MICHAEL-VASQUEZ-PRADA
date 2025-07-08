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
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 255, 183, 0),
        title: Text("Michael Vasquez"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: const Color.fromARGB(255, 104, 37, 117),
            child: Center(child: Text(index.toString())),
          );
        },
      ),
    );
  }
}