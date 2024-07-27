import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/nexus_generator.dart';

Builder nexus(BuilderOptions options) {
  return PartBuilder([NexusGenerator()], '.gr.dart');
}
