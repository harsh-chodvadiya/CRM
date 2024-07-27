import 'dart:io';

import 'package:nexus/src/extension/string.dart';

void main(List<String> name) {
  if (Directory('$_currentPath/lib/controller').existsSync()) {
    _writeFile('$_currentPath/lib/controller');
  } else if (Directory('$_currentPath/lib/src/controller').existsSync()) {
    _writeFile('$_currentPath/lib/src/controller');
  }
}

String get _currentPath => Directory.current.path;

void _writeFile(String path) {
  final files = Directory(path).listSync();

  for (FileSystemEntity file in files) {
    if (file.path.endsWith('.dart')) {
      if (File(file.path).readAsStringSync().trim().isEmpty) {
        final String fileName = file.path.split('/').last.split('.').first;
        final StringBuffer coreBuffer = _core(fileName);
        final codedFile = File(file.path);
        codedFile.writeAsStringSync(coreBuffer.toString());
      }
    } else {
      _writeFile(file.path);
    }
  }
}

StringBuffer _core(String name) {
  final String className = name
      .trim()
      .replaceAll('controller', '')
      .split('_')
      .map((e) => (e[0].toUpperCase() + e.substring(1).toLowerCase()))
      .join('');

  final buffer = StringBuffer('''
import 'package:http/http.dart';
import 'package:nexus/nexus.dart';

part '$name.gr.dart';

class ${className}Controller extends NexusController<${className}State> {
  ${className}Controller() : super(const _Initial());

  Future<void> ${name.trim().split(' ').map((e) => e.isEmpty ? e : e.capitalizeFirst).join('').lowerFirst}() async {}
}

@nexus
class ${className}State with _${className}State {
  const factory ${className}State.initial() = _Initial;
  const factory ${className}State.loading() = _Loading;
  const factory ${className}State.success() = _Success;
  const factory ${className}State.error(String error) = _Error;
}
''');
  return buffer;
}
