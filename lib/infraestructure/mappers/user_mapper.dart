

import 'package:prueba_1/domain/domain.dart';

class UserMapper {


  static User userJsonToEntity( Map<String, dynamic> json ) => User(
    id: json['id'], 
    correo: json['correo'], 
    nombre: json['nombre'],
    apellidos: json['apellidos'],
    activado: json['activado'],
    img: json['img'] ?? 'no-image',
    fechaCreacion: json['fechaCreacion'],
    fechaActualizacion: json['fechaActualizacion'],
    role: json['role'], 
    token: json['token'] 
  );

}