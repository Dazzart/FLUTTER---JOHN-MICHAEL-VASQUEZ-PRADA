class Categoria {
  final int idCategoria;
  final String nombreCategoria;
  final String descripcionCategoria;

  Categoria({
    required this.idCategoria,
    required this.nombreCategoria,
    required this.descripcionCategoria,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      idCategoria: json['id_categoria'],
      nombreCategoria: json['nombre_categoria'],
      descripcionCategoria: json['descripcion_categoria'],
    );
  }
}
