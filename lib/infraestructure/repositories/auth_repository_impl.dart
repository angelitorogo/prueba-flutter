import 'package:prueba_1/domain/domain.dart';
import 'package:prueba_1/infraestructure/datasources/auth_datasource_impl.dart';



class AuthRepositoryImpl extends AuthRepository {

  final AuthDataSource dataSource;

  AuthRepositoryImpl({ AuthDataSource? dataSource }) : dataSource = dataSource ?? AuthDataSourceImpl();



  @override
  Future<User> checkAuthStatus(String token) {
    
    return dataSource.checkAuthStatus(token);
    
  }

  @override
  Future<User> login(String correo, String password) {
    
    return dataSource.login(correo, password);

  }

  @override
  Future<User> register(String correo, String password, String nombre, String apellidos) {
    
    return dataSource.register(correo, password, nombre, apellidos);

  }



}