// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class JsonGenerator extends GeneratorForAnnotation<JSONGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();
    String className = '${visitor.className}Gen';
    buffer.writeln('class $className {');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln(
        'final ${visitor.fields.values.elementAt(i)} ${visitor.fields.keys.elementAt(i)};',
      );
    }
    // CONSTRUCTOR
    buffer.writeln('const $className({');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln(
        'required this.${visitor.fields.keys.elementAt(i)},',
      );
    }
    buffer.writeln('});');

    // TO MAP
    buffer.writeln('Map<String, dynamic> toMap() {');
    buffer.writeln('return {');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln(
        "'${visitor.fields.keys.elementAt(i)}': ${visitor.fields.keys.elementAt(i)},",
      );
    }
    buffer.writeln('};');
    buffer.writeln('}');

    // FROM MAP
    buffer.writeln('factory $className.fromMap(Map<String, dynamic> map) {');
    buffer.writeln('return $className(');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln(
        "${visitor.fields.keys.elementAt(i)}: map['${visitor.fields.keys.elementAt(i)}'],",
      );
    }
    buffer.writeln(');');
    buffer.writeln('}');

    // copyWith
    buffer.writeln('$className copyWith({');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln(
        '${visitor.fields.values.elementAt(i)}? ${visitor.fields.keys.elementAt(i)},',
      );
    }
    buffer.writeln('}) {');
    buffer.writeln('return $className(');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln(
        "${visitor.fields.keys.elementAt(i)}: ${visitor.fields.keys.elementAt(i)} ?? this.${visitor.fields.keys.elementAt(i)},",
      );
    }
    buffer.writeln(');');
    buffer.writeln('}');
    buffer.writeln('}');

    return buffer.toString();
  }
}
