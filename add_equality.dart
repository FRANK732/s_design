// import 'dart:io';

// void main() {
//   var dir = Directory('lib/src/presentation/themes/extensions/component_themes');
//   var files = dir.listSync().whereType<File>().where((f) => f.path.endsWith('.dart'));

//   for (var file in files) {
//     var content = file.readAsStringSync();
//     if (content.contains('operator ==')) continue;

//     // Find the main theme data class
//     var classMatch = RegExp(r'class ([A-Za-z0-9_]+ThemeData)\s+extends').firstMatch(content);
//     if (classMatch == null) continue;
//     var className = classMatch.group(1)!;

//     // Find the constructor to extract fields
//     var constructorMatch = RegExp('const \\s*\\({([^}]+)}\\);').firstMatch(content);
//     if (constructorMatch == null) continue;

//     var fieldsRaw = constructorMatch.group(1)!;
//     var fields = RegExp(r'this\.([A-Za-z0-9_]+)')
//         .allMatches(fieldsRaw)
//         .map((m) => m.group(1)!)
//         .toList();

//     var equalityStr = "\n  @override\n  bool operator ==(Object other) {\n    if (identical(this, other)) return true;\n    if (other.runtimeType != runtimeType) return false;\n    return other is ";
//     for (var field in fields) {
//       equalityStr += " &&\n        other. == ";
//     }
//     equalityStr += ";\n  }\n";

//     var hashCodeStr = "\n  @override\n  int get hashCode {\n    return Object.hashAll([\n";
//     for (var field in fields) {
//       hashCodeStr += "      ,\n";
//     }
//     hashCodeStr += "    ]);\n  }\n";

//     // Insert before the last '}' of the class
//     var lerpMatch = RegExp(r'lerp\([^}]+\}\n  \}').allMatches(content).lastOrNull;
//     if (lerpMatch != null) {
//       var insertPos = lerpMatch.end;
//       var newContent = content.substring(0, insertPos) +
//           equalityStr +
//           hashCodeStr +
//           content.substring(insertPos);
//       file.writeAsStringSync(newContent);
//       print('Updated ');
//     }
//   }
// }
