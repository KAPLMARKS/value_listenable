import 'package:flutter/widgets.dart';
import 'value_listenable.dart';

/// Виджет, слушающий изменения значения и ребилдится
class ValueListenableBuilder<T> extends StatefulWidget {
  /// Конструктор, принимающий [ValueListenable] значения и билдер
  const ValueListenableBuilder({
    Key? key,
    required this.valueListenable,
    required this.builder,
  }) : super(key: key);

  /// [ValueListenable] значения
  final ValueListenable<T> valueListenable;

  /// Билдер, который вызвается при каждом изменении значения
  final WidgetBuilder builder;

  @override
  State<ValueListenableBuilder<T>> createState() =>
      _ValueListenableBuilderState<T>();
}

class _ValueListenableBuilderState<T> extends State<ValueListenableBuilder<T>> {
  /// Метод инициализации при котором добавляется слушатель
  /// для слушаемого значения [ValueListenableBuilder.valueListenable]
  @override
  void initState() {
    super.initState();
    widget.valueListenable.addListener(_onValueChanged);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  /// Метод деинициализации при котором удаляется слушатель
  /// для слушаемого значения [ValueListenableBuilder.valueListenable]
  @override
  void dispose() {
    super.dispose();
    widget.valueListenable.removeListener(_onValueChanged);
  }

  /// Слушатель.
  /// Ребилдит виджет
  void _onValueChanged() {
    setState(() {});
  }
}
