import 'package:analyzer/dart/element/element.dart';

class Constructor {
  Constructor({
    required ClassElement element,
    required String name,
    required int index,
  }) {
    constructors = element.constructors;
    stateName = element.name;
    className = name;
    constructorName = element.constructors[index].name;
    parameters = element.constructors[index].children;
  }

  late List<ConstructorElement> constructors;
  late String stateName;
  late String className;
  late String constructorName;
  late List<Element> parameters;
}
