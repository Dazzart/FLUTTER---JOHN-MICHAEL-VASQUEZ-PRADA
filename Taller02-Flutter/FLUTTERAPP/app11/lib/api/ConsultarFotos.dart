import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Foto>> ConsultarFotos() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return compute(_parseFotos, response.body);
  } else {
    throw Exception("Error al cargar las fotos");
  }
}

List<Foto> _parseFotos(String responseBody) {
  final List<dynamic> parsed = json.decode(responseBody);
  return parsed.map<Foto>((json) => Foto.fromJson(json)).toList();
}

class Foto {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Foto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Foto.fromJson(Map<String, dynamic> json) {
    return Foto(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
