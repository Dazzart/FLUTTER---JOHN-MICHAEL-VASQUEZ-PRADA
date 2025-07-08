import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/subcategorias.dart';
import '../models/categoria.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  // SUBCATEGORIAS
  static Future<List<Subcategoria>> fetchSubcategorias() async {
    final response = await http.get(Uri.parse('$baseUrl/subcategorias'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => Subcategoria.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar subcategorías');
    }
  }

  static Future<void> crearSubcategoria(Subcategoria subcategoria) async {
    final response = await http.post(
      Uri.parse('$baseUrl/subcategorias'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(subcategoria.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Error al crear subcategoría');
    }
  }

  static Future<void> actualizarSubcategoria(int id, Subcategoria subcategoria) async {
    final response = await http.put(
      Uri.parse('$baseUrl/subcategorias/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(subcategoria.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al actualizar subcategoría');
    }
  }

  static Future<void> eliminarSubcategoria(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/subcategorias/$id'));
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar subcategoría');
    }
  }

  // CATEGORIAS
  static Future<List<Categoria>> fetchCategorias() async {
    final response = await http.get(Uri.parse('$baseUrl/categorias'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => Categoria.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar categorías');
    }
  }

  static Future<void> crearCategoria(Categoria categoria) async {
    final response = await http.post(
      Uri.parse('$baseUrl/categorias'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(categoria.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Error al crear categoría');
    }
  }

  static Future<void> actualizarCategoria(int id, Categoria categoria) async {
    final response = await http.put(
      Uri.parse('$baseUrl/categorias/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(categoria.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al actualizar categoría');
    }
  }

  static Future<void> eliminarCategoria(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/categorias/$id'));
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar categoría');
    }
  }
}
