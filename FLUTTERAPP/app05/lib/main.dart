import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp(Principal());
}
class Principal extends StatelessWidget {
  const Principal({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Informacion Personal",
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 51, 255, 0),
          title: Text("Información Personal"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image(
                image: NetworkImage("web/asd.webp"),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover, 
              ),

              ListTile(
                title: Text("Michael"),
                subtitle: Text("Nombres"),
                leading: Icon(Icons.person),
              ),
              Divider(),
              ListTile(
                title: Text("Vasquez"),
                subtitle: Text("Apellidos"),
                leading: Icon(Icons.person_add_alt),
              ),  
              Divider(),
              ListTile(
                title: Text("213213123"),
                subtitle: Text("Celular"),
                leading: Icon(Icons.phone),
              ),
              Divider(),
              ListTile(
                title: Text("Bogota D.C"),
                subtitle: Text("Regional"),
                leading: Icon(Icons.location_city),
              ),
              Divider(),
              ListTile(
                title: Text("CEET"),
                subtitle: Text("Centro de Formación"),
                leading: Icon(Icons.location_on),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}