import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Noticias>> ConsultarNoticias() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return compute(pasaraListarNoticias, response.body);
  } else {
    throw Exception('Error al cargar noticias');
  }
}

List<Noticias> pasaraListarNoticias(String respuestaBody) {
  final List<dynamic> parsed = json.decode(respuestaBody);
  return parsed.map<Noticias>((json) => Noticias.fromJson(json)).toList();
}

class Noticias {
  final int userId;
  final int id;
  final String title;
  final String body;

  Noticias({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Noticias.fromJson(Map<String, dynamic> json) {
    return Noticias(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
