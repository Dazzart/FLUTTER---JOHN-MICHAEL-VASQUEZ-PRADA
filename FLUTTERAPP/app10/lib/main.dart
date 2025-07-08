import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Principal());
}

final txtNombre = TextEditingController();
final txtPrograma = TextEditingController();
final txtCorreo = TextEditingController();
final txtFicha = TextEditingController();
final txtFoto = TextEditingController();
final txtColor = TextEditingController();

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FICHA | #2925960",
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
        title: Text("FICHA | #2925960"),
        backgroundColor: const Color.fromARGB(255, 231, 0, 0),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: aprendices.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(aprendices[index]["foto"]),
            ),
            title: Text(aprendices[index]["nombre"]),
            subtitle: Text(aprendices[index]["programa"]),
            trailing: Icon(Icons.arrow_circle_right_sharp),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(aprendices[index]["nombre"]),
                    ),
                    body: ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(aprendices[index]["foto"]),
                        ),
                        SizedBox(height: 16),
                        Text("Programa: ${aprendices[index]["programa"]}"),
                        Text("Correo: ${aprendices[index]["correo"]}"),
                        Text("Ficha: ${aprendices[index]["ficha"]}"),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                  title: Text("Nuevo Aprendiz"),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: txtNombre,
                        decoration: InputDecoration(
                          labelText: "Nombre",
                          hintText: "Nombre del aprendiz",
                          icon: Icon(Icons.person),
                        ),
                      ),
                      TextFormField(
                        controller: txtPrograma,
                        decoration: InputDecoration(
                          labelText: "Programa",
                          hintText: "Programa de formación",
                          icon: Icon(Icons.school),
                        ),
                      ),
                      TextFormField(
                        controller: txtCorreo,
                        decoration: InputDecoration(
                          labelText: "Correo",
                          hintText: "Correo institucional",
                          icon: Icon(Icons.email),
                        ),
                      ),
                      TextFormField(
                        controller: txtFicha,
                        decoration: InputDecoration(
                          labelText: "Ficha",
                          hintText: "Número de ficha",
                          icon: Icon(Icons.badge),
                        ),
                      ),
                      TextFormField(
                        controller: txtFoto,
                        decoration: InputDecoration(
                          labelText: "Fotografía",
                          hintText: "URL de la fotografía",
                          icon: Icon(Icons.photo),
                        ),
                      ),
                      TextFormField(
                        controller: txtColor,
                        decoration: InputDecoration(
                          labelText: "Color",
                          hintText: "Color identificativo (opcional)",
                          icon: Icon(Icons.color_lens),
                        ),
                      ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  onPressed: () {
                    if (txtNombre.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content:
                              Text("ERROR! El nombre del aprendiz está vacío")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                              "Se ha guardado satisfactoriamente el aprendiz: ${txtNombre.text}")));
                    }
                  },
                  child: Icon(Icons.save),
                ),
              );
            },
          );
        },
        child: Icon(Icons.account_circle),
      ),
    );
  }
}

List<Map<String, dynamic>> aprendices = [
  {
    'nombre': 'Michael Vasquez',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'michael@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.teal,
    'foto': 'assets/images/img1.jpg'
  },
  {
    'nombre': 'Miguel Torres',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'miguel@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.green,
    'foto': 'assets/images/img1.jpg'
  },
  {
    'nombre': 'Jose Daza',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'jose@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.blue,
    'foto': 'assets/images/img1.jpg'
  },
  {
    'nombre': 'Jose Zabaleta',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'jose@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.orange,
    'foto': 'assets/images/img1.jpg'
  },
  {
    'nombre': 'David Meneses',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'david@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.purple,
    'foto': 'assets/images/img1.jpg'
  },
  {
    'nombre': 'Alan Cadena',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'alan@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.red,
    'foto': 'assets/images/img1.jpg'
  }
];
