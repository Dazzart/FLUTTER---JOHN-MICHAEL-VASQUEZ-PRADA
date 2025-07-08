import 'package:flutter/material.dart';
import 'api/api.dart';
import 'models/usuario.dart';
import 'models/categoria.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API MySQL',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Usuario>> usuarios;
  late Future<List<Categoria>> categorias;

  @override
  void initState() {
    super.initState();
    usuarios = ApiService.fetchUsuarios();
    categorias = ApiService.fetchCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('API DAZZART COMPONENTS - Flutter CATEGORIAS Y USUARIOS'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Usuarios', icon: Icon(Icons.person)),
              Tab(text: 'Categorías', icon: Icon(Icons.category)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<Usuario>>(
              future: usuarios,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay usuarios'));
                } else {
                  final usuarios = snapshot.data!;
                  return ListView.builder(
                    itemCount: usuarios.length,
                    itemBuilder: (context, index) {
                      final u = usuarios[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(u.nombre[0])),
                        title: Text(u.nombre),
                        subtitle: Text('Correo: ${u.correoElectronico}\nTel: ${u.telefono}'),
                        isThreeLine: true,
                      );
                    },
                  );
                }
              },
            ),

            FutureBuilder<List<Categoria>>(
              future: categorias,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay categorías'));
                } else {
                  final categorias = snapshot.data!;
                  return ListView.builder(
                    itemCount: categorias.length,
                    itemBuilder: (context, index) {
                      final c = categorias[index];
                      return ListTile(
                        title: Text(c.nombreCategoria),
                        subtitle: Text(c.descripcionCategoria),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
