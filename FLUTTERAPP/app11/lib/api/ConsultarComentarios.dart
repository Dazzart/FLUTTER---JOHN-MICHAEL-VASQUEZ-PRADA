import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Comentario>> ConsultarComentarios() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return compute(_parseComentarios, response.body);
  } else {
    throw Exception("Error al cargar los comentarios");
  }
}

List<Comentario> _parseComentarios(String responseBody) {
  final List<dynamic> parsed = json.decode(responseBody);
  return parsed.map<Comentario>((json) => Comentario.fromJson(json)).toList();
}

class Comentario {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comentario({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comentario.fromJson(Map<String, dynamic> json) {
    return Comentario(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
