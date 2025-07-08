import 'package:flutter/material.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FICHA | 295960", // Cambia el número de ficha aquí
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
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 38, 0, 255),
        title: const Text("FICHA | 295960"), // Cambia el número de ficha aquí
      ),
      body: ListView.builder(
        itemCount: aprendices.length,
        itemBuilder: (BuildContext context, int index) {
          final aprendiz = aprendices[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(aprendiz['foto']),
            ),
            title: Text(aprendiz['nombre']),
            subtitle: Text(aprendiz['correo']),
            tileColor: aprendiz['color'], // Color de fondo
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext ctx) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          aprendiz['nombre'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Correo: ${aprendiz['correo']}'),
                        Text('Ficha: ${aprendiz['ficha']}'),
                        Text('Teléfono: ${aprendiz['telefono']}'),
                        // Puedes agregar más datos aquí
                      ],
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
    'correo': 'michaelvaskes2017@gmail.com',
    'ficha': '295960',
    'telefono': '+57 300 123 4567',
    'color': const Color.fromARGB(255, 255, 255, 255),
    'foto': 'assets/images/img1.jpg',
  },
  {
    'nombre': 'Miguel Torres',
    'correo': 'MiguelT@email.com',
    'ficha': '295960',
    'telefono': '+57 310 765 4321',
    'color': const Color.fromARGB(255, 255, 0, 0),
    'foto': 'assets/images/img1.jpg',
  },
  {
    'nombre': 'Jose Daza',
    'correo': 'JoseD@email.com',
    'ficha': '295960',
    'telefono': '+57 320 987 6543',
    'color': const Color.fromARGB(255, 255, 255, 255),
    'foto': 'assets/images/img1.jpg',
  },
  {
    'nombre': 'Jose Zabaleta',
    'correo': 'JoseZ@email.com',
    'ficha': '295960',
    'telefono': '+57 310 765 4321',
    'color': const Color.fromARGB(255, 255, 0, 0),
    'foto': 'assets/images/img1.jpg',
  },
    {
    'nombre': 'David Meneses',
    'correo': 'David@email.com',
    'ficha': '295960',
    'telefono': '+57 310 765 4321',
    'color': const Color.fromARGB(255, 255, 255, 255),
    'foto': 'assets/images/img1.jpg',
  },
    {
    'nombre': 'Alan Cadena',
    'correo': 'Alan@email.com',
    'ficha': '295960',
    'telefono': '+57 310 765 4321',
    'color': const Color.fromARGB(255, 255, 0, 0),
    'foto': 'assets/images/img1.jpg',
  },

      {
    'nombre': 'Santiago Moralez',
    'correo': 'santiago@email.com',
    'ficha': '295960',
    'telefono': '+57 310 765 4321',
    'color': const Color.fromARGB(255, 255, 255, 255),
    'foto': 'assets/images/img1.jpg',
  },
];
