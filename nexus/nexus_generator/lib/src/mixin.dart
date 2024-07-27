import 'package:analyzer/dart/element/element.dart';

class Mixin {
  Mixin({required this.name, required this.constructor});
  final String name;
  final List<ConstructorElement> constructor;

  @override
  String toString() {
    return '''
mixin _$name {
  TResult when<TResult extends Object?>({
    ${_parameters('when')}
  }) =>
      throw _privateConstructorUsedError;

  TResult? whenOrNull<TResult extends Object?>({
    ${_parameters('whenOrNull')}
  }) =>
      throw _privateConstructorUsedError;

  TResult maybeWhen<TResult extends Object?>({
    ${_parameters('maybeWhen')}
  }) =>
      throw _privateConstructorUsedError;
}
''';
  }

  String _parameters(String type) {
    var data = '''''';
    for (var c in constructor) {
      if (type == 'when') {
        if (c.children.isEmpty) {
          data += 'required TResult Function() ${c.name},\n';
        } else {
          data +=
              'required TResult Function${c.children.map((e) => e)} ${c.name},\n';
        }
      } else if (type == 'whenOrNull') {
        if (c.children.isEmpty) {
          data += 'TResult? Function()? ${c.name},\n';
        } else {
          data += 'TResult? Function${c.children.map((e) => e)}? ${c.name},\n';
        }
      } else if (type == 'maybeWhen') {
        if (c.children.isEmpty) {
          data += 'TResult Function()? ${c.name},\n';
        } else {
          data += 'TResult Function${c.children.map((e) => e)}? ${c.name},\n';
        }
      }
    }
    if (type == 'maybeWhen') {
      data += 'required TResult Function() orElse,\n';
    }
    return data;
  }
}
