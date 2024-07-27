import 'package:analyzer/dart/element/element.dart';

import 'model.dart';

class Abstract {
  Abstract({required this.constructor});
  final Constructor constructor;

  @override
  String toString() {
    return '''
class ${constructor.className} implements ${constructor.stateName} {
  const ${constructor.className}${constructor.parameters.map((e) => 'this.${e.name}')};

  $_properties
  ${When(elements: constructor.constructors, name: constructor.constructorName, parameters: constructor.parameters).toString()}
}
''';
  }

  String get _properties {
    var properties = '';
    for (var e in constructor.parameters) {
      properties += 'final $e;\n';
    }
    return properties;
  }
}

class When {
  When({required this.elements, required this.name, required this.parameters});
  final List<ConstructorElement> elements;
  final String name;
  final List<Element> parameters;

  @override
  String toString() {
    return '''
  @override
  TResult when<TResult extends Object?>({
    ${_constructor('when')}
  }) => ${_parameters('when', name)}

  @override
  TResult? whenOrNull<TResult extends Object?>({
    ${_constructor('whenOrNull')}
  }) => ${_parameters('whenOrNull', name)}

  @override
  TResult maybeWhen<TResult extends Object?>({
    ${_constructor('maybeWhen')}
  }) {
    if ($name != null) ${_parameters('maybeWhen', name)}
    return orElse();
  }
''';
  }

  String _parameters(String type, String name) {
    if (type == 'when') {
      if (parameters.isEmpty) {
        return '$name();';
      } else {
        return '$name${parameters.map((e) => e.name == name ? 'this.${e.name}' : e.name)};';
      }
    } else if (type == 'whenOrNull') {
      if (parameters.isEmpty) {
        return '$name?.call();';
      } else {
        return '$name?.call${parameters.map((e) => e.name == name ? 'this.${e.name}' : e.name)};';
      }
    } else {
      if (parameters.isEmpty) {
        return 'return $name();';
      } else {
        return 'return $name${parameters.map((e) => e.name == name ? 'this.${e.name}' : e.name)};';
      }
    }
  }

  String _constructor(String type) {
    var data = '''''';
    for (var c in elements) {
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
