import 'package:flutter/material.dart';
import 'api/api.dart';
import 'models/subcategorias.dart';
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
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late Future<List<Subcategoria>> subcategorias;
  late Future<List<Categoria>> categorias;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _loadData();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _loadData() {
    subcategorias = ApiService.fetchSubcategorias();
    categorias = ApiService.fetchCategorias();
  }

  void refreshData() {
    setState(() {
      _loadData();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _showSubcategoriaForm({Subcategoria? subcategoria}) async {
    final nombreController = TextEditingController(text: subcategoria?.nombreSubcategoria ?? '');
    final descripcionController = TextEditingController(text: subcategoria?.descripcionSubcategoria ?? '');
    final idCategoriaController = TextEditingController(text: subcategoria?.idCategoria.toString() ?? '');

    final formKey = GlobalKey<FormState>();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(subcategoria == null ? 'Crear Subcategoría' : 'Editar Subcategoría'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre Subcategoría'),
                  validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                ),
                TextFormField(
                  controller: descripcionController,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                ),
                TextFormField(
                  controller: idCategoriaController,
                  decoration: const InputDecoration(labelText: 'ID Categoría'),
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Requerido';
                    if (int.tryParse(v) == null) return 'Solo números';
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final nuevaSubcategoria = Subcategoria(
                  idSubcategoria: subcategoria?.idSubcategoria ?? 0,
                  nombreSubcategoria: nombreController.text,
                  descripcionSubcategoria: descripcionController.text,
                  idCategoria: int.parse(idCategoriaController.text),
                );
                try {
                  if (subcategoria == null) {
                    await ApiService.crearSubcategoria(nuevaSubcategoria);
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Subcategoría creada')));
                  } else {
                    await ApiService.actualizarSubcategoria(subcategoria.idSubcategoria, nuevaSubcategoria);
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Subcategoría actualizada')));
                  }
                  if (!mounted) return;
                  Navigator.pop(context);
                  refreshData();
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                }
              }
            },
            child: Text(subcategoria == null ? 'Crear' : 'Guardar'),
          ),
        ],
      ),
    );
  }

  void onDeleteSubcategoria(int id) async {
    try {
      await ApiService.eliminarSubcategoria(id);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Subcategoría eliminada')));
      refreshData();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al eliminar subcategoría: $e')));
    }
  }

  void onDeleteCategoria(int id) async {
    try {
      await ApiService.eliminarCategoria(id);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Categoría eliminada')));
      refreshData();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al eliminar categoría: $e')));
    }
  }

  Future<void> _showCategoriaForm({Categoria? categoria}) async {
    final nombreController = TextEditingController(text: categoria?.nombreCategoria ?? '');
    final descripcionController = TextEditingController(text: categoria?.descripcionCategoria ?? '');

    final formKey = GlobalKey<FormState>();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(categoria == null ? 'Crear Categoría' : 'Editar Categoría'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(labelText: 'Nombre Categoría'),
                validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
              ),
              TextFormField(
                controller: descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final nuevaCategoria = Categoria(
                  idCategoria: categoria?.idCategoria ?? 0,
                  nombreCategoria: nombreController.text,
                  descripcionCategoria: descripcionController.text,
                );
                try {
                  if (categoria == null) {
                    await ApiService.crearCategoria(nuevaCategoria);
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Categoría creada')));
                  } else {
                    await ApiService.actualizarCategoria(categoria.idCategoria, nuevaCategoria);
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Categoría actualizada')));
                  }
                  if (!mounted) return;
                  Navigator.pop(context);
                  refreshData();
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                }
              }
            },
            child: Text(categoria == null ? 'Crear' : 'Guardar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API DAZZART COMPONENTS - Subcategorías y Categorías'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Subcategorías', icon: Icon(Icons.list_alt)),
            Tab(text: 'Categorías', icon: Icon(Icons.category)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Subcategorías
          FutureBuilder<List<Subcategoria>>(
            future: subcategorias,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No hay subcategorías'));
              } else {
                final subcategorias = snapshot.data!;
                return ListView.builder(
                  itemCount: subcategorias.length,
                  itemBuilder: (context, index) {
                    final s = subcategorias[index];
                    return ListTile(
                      title: Text(s.nombreSubcategoria),
                      subtitle: Text('Descripción: ${s.descripcionSubcategoria}\nID Categoría: ${s.idCategoria}'),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _showSubcategoriaForm(subcategoria: s),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => onDeleteSubcategoria(s.idSubcategoria),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
          // Categorías
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _showCategoriaForm(categoria: c),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => onDeleteCategoria(c.idCategoria),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_tabController.index == 0) {
            _showSubcategoriaForm();
          } else {
            _showCategoriaForm();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
