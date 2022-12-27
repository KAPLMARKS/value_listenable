/// Шаблон слушателя
typedef Listener = void Function();

/// Интерфейс, позволяющий слушать изменения значения
abstract class ValueListenable<T> {
  /// Геттер значения
  T get value;

  /// Метод, позволяющий добавлять нового слушателя
  void addListener(Listener listener);

  /// Метод, позволяющий удалять слушателя
  void removeListener(Listener listener);
}

/// Класс, который позволяет слушать и изменять значения
class ValueNotifier<T> implements ValueListenable<T> {
  /// Конструктор, принимающий изначальное значение
  ValueNotifier(this._value);

  /// Список слушателей
  final List<Listener> _listeners = [];

  /// Слушаемое значение
  T _value;

  @override
  T get value => _value;

  /// Сеттер слушаемоего значения, при вызове которого вызываются слушатели [_listeners]
  set value(T value) {
    _value = value;
    for (final Listener listener in _listeners) {
      listener.call();
    }
  }

  @override
  void addListener(Listener listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(Listener listener) {
    _listeners.remove(listener);
  }
}
