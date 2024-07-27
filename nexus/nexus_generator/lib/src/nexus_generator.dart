import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:nexus_annotation/nexus_annotation.dart';
import 'package:nexus_generator/src/abstract.dart';
import 'package:source_gen/source_gen.dart';

import 'mixin.dart';
import 'model.dart';

class NexusGenerator extends GeneratorForAnnotation<NexusAnnotation> {
  NexusGenerator();

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) sync* {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        '@nexus can only be applied on classes. Failing element: ${element.name}',
        element: element,
      );
    }

    yield '''
final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`.'
    'This constructor is only meant to be used by nexus and you are not supposed to need it nor use it.');
''';

    yield Mixin(name: element.name, constructor: element.constructors)
        .toString();

    final constructor = _classElement(element);

    for (var i = 0; i < constructor.length; i++) {
      yield Abstract(
        constructor: Constructor(
          element: element,
          name: constructor[i],
          index: i,
        ),
      ).toString();
    }
  }

  List<String> _classElement(ClassElement element) {
    final library = element.library.session
        .getParsedLibraryByElement(element.library) as ParsedLibraryResult?;
    final node =
        library?.getElementDeclaration(element)?.node.childEntities.toList();
    node?.removeWhere((e) => !e.toString().contains('='));
    final redirect = <String>[];
    for (var i = 0; i < (node?.length ?? 0); i++) {
      redirect
          .add(node![i].toString().split('=').last.replaceAll(';', '').trim());
    }
    return redirect;
  }
}
