import 'package:prueba_1/domain/domain.dart';

abstract class AuthRepository {

Future<User> login( String correo, String password);
Future<User> register( String correo, String password, String nombre, String apellidos);

Future<User> checkAuthStatus( String token);

}