
import 'dart:io';

void main() {
  final file = File('lib/src/presentation/localizations/s_localizations.dart');
  if (!file.existsSync()) {
    print('File not found');
    return;
  }

  final content = file.readAsStringSync();
  
  // Find abstract class block
  final abstractStart = content.indexOf('abstract class SLocalizations');
  final abstractEnd = content.indexOf('class SLocalizationsEn');
  final abstractBlock = content.substring(abstractStart, abstractEnd);

  // Find En, Fr, Ar, Zh blocks
  final enStart = content.indexOf('class SLocalizationsEn');
  final frStart = content.indexOf('class SLocalizationsFr');
  final arStart = content.indexOf('class SLocalizationsAr');
  final zhStart = content.indexOf('class SLocalizationsZh');
  
  final enBlock = content.substring(enStart, frStart);
  final frBlock = content.substring(frStart, arStart);
  final arBlock = content.substring(arStart, zhStart);
  final zhBlock = content.substring(zhStart);

  Set<String> findMembers(String block) {
    Set<String> members = {};
    // Regex for get members: String\s+get\s+(\w+)
    // But they can have newlines. Let's use DOTALL and allow any whitespace
    final getterRegex = RegExp(r'String\s+get\s+(\w+)', multiLine: true);
    for (var match in getterRegex.allMatches(block)) {
      members.add(match.group(1)!);
    }
    
    // Regex for methods: String\s+(\w+)\(
    final methodRegex = RegExp(r'String\s+(\w+)\(', multiLine: true);
    for (var match in methodRegex.allMatches(block)) {
       // Filter out common false positives if any
       final name = match.group(1)!;
       if (name != 'SLocalizations' && name != 'ofContext') {
         members.add(name);
       }
    }
    return members;
  }

  // Improved regex for the specific formatting in this file
  Set<String> findMembersStrict(String block) {
    Set<String> members = {};
    // This file uses:
    // String
    //     get name;
    // OR
    // String
    //     name(params);
    
    final lines = block.split('\n');
    for (int i = 0; i < lines.length - 1; i++) {
        final line = lines[i].trim();
        final nextLine = lines[i+1].trim();
        
        if (line == 'String') {
            if (nextLine.startsWith('get ')) {
                final name = nextLine.substring(4).replaceAll(';', '').trim();
                members.add(name);
            } else if (nextLine.contains('(')) {
                final name = nextLine.split('(')[0].trim();
                if (name != 'SLocalizations' && name != 'ofContext') {
                    members.add(name);
                }
            }
        }
    }
    return members;
  }

  final abstractMembers = findMembersStrict(abstractBlock);
  print('Total abstract members found: ${abstractMembers.length}');

  void check(String name, String block) {
    final implemented = findMembersStrict(block);
    final missing = abstractMembers.difference(implemented);
    print('\n$name:');
    print('Implemented: ${implemented.length}');
    print('Missing: ${missing.length}');
    if (missing.isNotEmpty) {
      final list = missing.toList()..sort();
      print('Missing: ${list.join(", ")}');
    }
  }

  check('En', enBlock);
  check('Fr', frBlock);
  check('Ar', arBlock);
  check('Zh', zhBlock);
}
