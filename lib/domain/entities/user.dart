


class User {

  final String id;
  final String correo;
  final String nombre;
  final String apellidos;
  final String role;
  final String img;
  final bool activado;
  final String token;
  final String fechaCreacion;
  final String fechaActualizacion;

  User({
    required this.id, 
    required this.correo, 
    required this.nombre, 
    required this.apellidos, 
    required this.role,
    required this.img,
    required this.activado, 
    required this.token, 
    required this.fechaCreacion, 
    required this.fechaActualizacion
  });


  bool get isAdmin {
    return role == 'ADMIN_ROLE';
  }

  bool get isActivated {
    return activado;
  }

  @override
  String toString() {
    // TODO: implement toString
    return '''
User logado:
    correo: $correo
    nombre: $nombre
    apellidos: $apellidos
    activado: $isActivated
    admin: $isAdmin
    imagen: $img
    token: $token
''';
  }

  

}