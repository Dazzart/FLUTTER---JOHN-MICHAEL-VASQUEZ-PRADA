import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';
import '../models/categoria.dart';
class ApiService {
  static const String baseUrl = 'http://localhost:3000'; 

  // Obtener lista de usuarios
  static Future<List<Usuario>> fetchUsuarios() async {
    final response = await http.get(Uri.parse('$baseUrl/usuarios'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }

  // Obtener lista de categorías
  static Future<List<Categoria>> fetchCategorias() async {
    final response = await http.get(Uri.parse('$baseUrl/categorias'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => Categoria.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar categorías');
    }
  }
}
