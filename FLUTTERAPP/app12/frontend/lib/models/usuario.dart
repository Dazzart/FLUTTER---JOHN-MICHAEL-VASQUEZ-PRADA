class Usuario {
  final int idUsuario;
  final String nombre;
  final String nombreUsuario;
  final String correoElectronico;
  final String telefono;
  final String cedula;
  final String direccion;
  final int idRol;

  Usuario({
    required this.idUsuario,
    required this.nombre,
    required this.nombreUsuario,
    required this.correoElectronico,
    required this.telefono,
    required this.cedula,
    required this.direccion,
    required this.idRol,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['id_usuario'],
      nombre: json['nombre'],
      nombreUsuario: json['nombre_usuario'],
      correoElectronico: json['correo_electronico'],
      telefono: json['telefono'],
      cedula: json['cedula'],
      direccion: json['direccion'],
      idRol: json['id_rol'],
    );
  }
}
