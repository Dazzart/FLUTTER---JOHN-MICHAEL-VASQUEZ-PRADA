class Subcategoria {
  final int idSubcategoria;
  final String nombreSubcategoria;
  final String descripcionSubcategoria;
  final int idCategoria;

  Subcategoria({
    required this.idSubcategoria,
    required this.nombreSubcategoria,
    required this.descripcionSubcategoria,
    required this.idCategoria,
  });

  factory Subcategoria.fromJson(Map<String, dynamic> json) {
    return Subcategoria(
      idSubcategoria: json['id_subcategoria'],
      nombreSubcategoria: json['nombre_subcategoria'] ?? '',
      descripcionSubcategoria: json['descripcion_subcategoria'],
      idCategoria: json['id_categoria'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_subcategoria': idSubcategoria,
        'nombre_subcategoria': nombreSubcategoria,
        'descripcion_subcategoria': descripcionSubcategoria,
        'id_categoria': idCategoria,
      };
}
