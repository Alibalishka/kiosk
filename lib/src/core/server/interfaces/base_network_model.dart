/// Все модели возвращаемые с сервера
/// должны наследоваться от этого класса
abstract class BaseModel<T> {
  T fromJson(Map<String, dynamic> json);
}
