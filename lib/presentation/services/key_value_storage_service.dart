

abstract class KeyValueStorageService {

  Future<void> setKeyValue<T>( String key, T value); // T es generico. Sabe que tipo de dato es...string, int, bool, etc

  Future<T?> getValue<T>( String key );  // T es generico. Sabe que tipo de dato es...string, int, bool, etc

  Future<bool> removeKey( String key );

}