# Nexus
A Flutter package for State Management, Local Storage, RegExps, Extension and Localization.


## Features
- State Management
- Local Storage
- Extension
  - String Extension
  - Context Extension
  - Iterable Extension
  - RegExp Extension
- Localization


## Usage

### NexusBox
A fast, extra light and synchronous key-value in memory. It is written entirely in Dart and Flutter. Supports Android, iOS. It can store String, int, double, Map and List.

#### Initialize storage:
```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NexusBox.initialize();
  runApp(MyApp());
}
```

#### Use NexusBox through an instance:
```dart
final nexusBox = NexusBox();
```

#### To write data use `set` :
```dart
nexusBox.set('message', 'NexusBox is best.');
```

#### To read values use `get`:
```dart
print(nexusBox.get('message'));
// output: NexusBox is best.
```

#### To listen changes use `listenable`:
```dart
ValueListenableBuilder<NexusBox>(
  valueListenable: nexusBox.listenable(),
  builder: (context, box, widget) {
    return Center(
      child: Text('${box.get('message')}'),
    );
  },
),
```

#### To remove a key use `remove`:
```dart
nexusBox.remove('message');
```

#### To delete box use `delete`:
```dart
nexusBox.delete();
```