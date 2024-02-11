import 'package:prueba_1/domain/entities/user.dart';

abstract class AuthDataSource {

Future<User> login( String correo, String password);
Future<User> register( String correo, String password, String nombre, String apellidos);

Future<User> checkAuthStatus( String token);

}