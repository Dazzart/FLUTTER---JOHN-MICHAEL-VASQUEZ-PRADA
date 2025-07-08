import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> ConsultarAlbum() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/albums");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return compute(pasaraListaAlbums, response.body);
  } else {
    throw Exception("Error al cargar albums");
  }
}

List<Album> pasaraListaAlbums(String respuestaBody) {
  final List<dynamic> parsed = json.decode(respuestaBody);
  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
