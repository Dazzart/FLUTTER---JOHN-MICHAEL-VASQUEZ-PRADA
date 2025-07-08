
   import 'package:flutter/material.dart';
   void main(List<String> args) {
     runApp(Principal());
   }
   class Principal extends StatelessWidget {
     const Principal({super.key});
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         title: "SENA | DISTRITO CAPITAL | CEET",
         home: Column(
           children: [
             Text("Aprendiz"),
             Text("Michael Vasquez"),
             Icon(Icons.calculate),
             Icon(Icons.star),
             ElevatedButton(onPressed: (){}, child: Text("Insertar")),
             ElevatedButton(onPressed: (){}, child: Text("Actualizar")),
             ElevatedButton(onPressed: (){}, child: Text("Guardar")),
           ],
         ),
       );
     }
   }   