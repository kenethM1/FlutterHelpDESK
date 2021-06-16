class Usuario {
  String? idUsuario;
  String? apellido;
  String? contrasena;
  String? correo;
  String? nombre;
  String? tipoUsuario;

  static const String collectionId = 'usuarios';
  Usuario(
      {this.idUsuario,
      this.apellido,
      this.contrasena,
      this.correo,
      this.nombre,
      this.tipoUsuario});

  Usuario.fromSnapshot(String idUsuario, Map<String, dynamic> usuario)
      : idUsuario = idUsuario,
        apellido = usuario['apellido'],
        contrasena = usuario['contrasena'],
        correo = usuario['correo'],
        nombre = usuario['nombre'],
        tipoUsuario = usuario['tipoUsuario'];

  Map<String, dynamic> toMap() => {
        'apellido': apellido,
        'contrasena': contrasena,
        'correo': correo,
        'nombre': nombre,
        'tipoUsuario': tipoUsuario,
      };

  @override
  String toString() {
    return 'Usuario{idUsuario: $idUsuario, apellidos: $apellido, contrasena: $contrasena, correo: $correo,nombres: $nombre, tipoUsuario: $tipoUsuario}';
  }

  void sendEmailVerification() {}
}
