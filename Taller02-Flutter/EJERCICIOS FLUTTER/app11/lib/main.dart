import 'package:app11/api/ConsultarAlbum.dart';
import 'package:app11/api/ConsultarFotos.dart';
import 'package:app11/api/ConsultarNoticias.dart';
import 'package:flutter/material.dart';
import 'package:app11/api/ConsultarComentarios.dart';


void main(List<String> args) {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SENA | CEET",
      home: HomePrincipal(),
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
        title: const Text("APIS MICHAEL VASQUEZ"),
        backgroundColor: const Color.fromARGB(255, 0, 201, 252),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.newspaper),
                title: const Text("Noticias"),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
                onTap: () {
                  ConsultarNoticias().then((resp) {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("Noticias"),
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(255, 31, 20, 182),
                          ),
                          body: ListView.builder(
                            itemCount: resp.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: ListTile(
                                  title: Text(resp[index].title),
                                  subtitle: Text(resp[index].body),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  });
                },
              ),
            ),
   Card(
  child: ListTile(
    leading: const Icon(Icons.comment),
    title: const Text("Comentarios"),
    trailing: const Icon(Icons.arrow_circle_right_outlined),
    onTap: () {
      ConsultarComentarios().then((resp) {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Comentarios"),
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              body: ListView.builder(
                itemCount: resp.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(resp[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(resp[index].email, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(resp[index].body),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      });
    },
  ),
),

            Card(
              child: ListTile(
                leading: const Icon(Icons.album),
                title: const Text("Albums"),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
                onTap: () {
                  ConsultarAlbum().then((resp) {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("Album"),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                          ),
                          body: ListView.builder(
                            itemCount: resp.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: ListTile(title: Text(resp[index].title)),
                              );
                            },
                          ),
                        );
                      },
                    );
                  });
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Fotos"),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
                onTap: () {
                  ConsultarFotos().then((resp) {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("Fotos"),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                          ),
                          body: ListView.builder(
                            itemCount: resp.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(resp[index].thumbnailUrl),
                                  ),
                                  title: Text(resp[index].title),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
