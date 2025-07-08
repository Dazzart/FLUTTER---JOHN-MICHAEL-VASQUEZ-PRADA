import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FICHA | #2925960",
      home: const HomePrincipal(),
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
        title: const Text("FICHA | #2925960"),
        backgroundColor: const Color.fromARGB(255, 0, 245, 122),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: aprendices.length,
        itemBuilder: (BuildContext context, int index) {
          final aprendiz = aprendices[index];
          return ListTile(
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(aprendiz['foto']),
            ),
            title: Text(aprendiz['nombre']),
            subtitle: Text(aprendiz['programa']),
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: aprendiz['color'],
                      title: Text(aprendiz['nombre']),
                      foregroundColor: Colors.white,
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView(
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(aprendiz['foto']),
                          ),
                          const SizedBox(height: 16),
                          Text("Programa: ${aprendiz['programa']}",
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          Text("Correo: ${aprendiz['correo']}",
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          Text("Ficha: ${aprendiz['ficha']}",
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
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
    'foto':
        'assets/images/img1.jpg',
  },
  {
    'nombre': 'Miguel Torres',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'miguel@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.green,
    'foto':
        'assets/images/img1.jpg',
  },
  {
    'nombre': 'Jose Daza',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'jose@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.blue,
    'foto':
        'assets/images/img1.jpg',
  },
  {
    'nombre': 'Jose Zabaleta',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'josez@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.orange,
    'foto':
        'assets/images/img1.jpg',
  },
  {
    'nombre': 'David Meneses',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'david@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.purple,
    'foto':
        'assets/images/img1.jpg',
  },
  {
    'nombre': 'Alan Cadena',
    'programa': 'Análisis y Desarrollo de Software',
    'correo': 'alan@sena.edu.co',
    'ficha': '2925960',
    'color': Colors.red,
    'foto':
        'assets/images/img1.jpg',
  },
];
