import 'package:dio/dio.dart';
import 'package:prueba_1/config/constants/environment.dart';
import 'package:prueba_1/domain/domain.dart';
import 'package:prueba_1/infraestructure/errors/auth_errors.dart';
import 'package:prueba_1/infraestructure/mappers/user_mapper.dart';


class AuthDataSourceImpl extends AuthDataSource {


  final dio = Dio(
    BaseOptions(baseUrl: Environment.apiUrl)
  );

  @override
  Future<User> checkAuthStatus(String token) async {
    
    try {

      final response = await dio.get('/check-token', options:  Options(
        headers: {
          'x-token': token
        }
      ));

      final user = UserMapper.userJsonToEntity(response.data['usuario']);

      return user;

      
    } on DioException catch (e) {

      if( e.response?.statusCode == 401 ) {
        throw CustomError( 'Token incorrecto' );
      }

      if(e.type == DioExceptionType.connectionError) {
        throw CustomError('No hay conexión');
      }

      throw Exception();

      
    } catch (e){

      throw Exception();
      
    }


  }

  @override
  Future<User> login(String correo, String password) async {
    
    try {

      final response = await dio.post('/login', data: {
        'correo': correo,
        'password': password
      });

      final user = UserMapper.userJsonToEntity(response.data['usuario']);

      print(user);


      return user;
      

      
    } on DioException catch (e) {

      if( e.response?.statusCode == 400 ) {
       throw CustomError(e.response?.data['msg'] ?? 'Credenciales incorrectas' );
      }

      if(e.type == DioExceptionType.connectionError) {
       throw CustomError('No hay conexión');
      }

      throw Exception();

      
    } catch (e){

      throw Exception();
      
    }

  }

  @override
  Future<User> register(String correo, String password, String name, String surname) {
    // TODO: implement register
    throw UnimplementedError();
  }


}