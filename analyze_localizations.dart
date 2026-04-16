import 'dart:io';

void
    main() {
  final File
      file =
      File('lib/src/presentation/localizations/s_localizations.dart');
  if (!file
      .existsSync()) {
    return;
  }

  final String
      content =
      file.readAsStringSync();

  final int
      abstractStart =
      content.indexOf('abstract class SLocalizations');
  final int
      abstractEnd =
      content.indexOf('class SLocalizationsEn');
  final String
      abstractBlock =
      content.substring(abstractStart,
          abstractEnd);

  final int
      enStart =
      content.indexOf('class SLocalizationsEn');
  final int
      frStart =
      content.indexOf('class SLocalizationsFr');
  final int
      arStart =
      content.indexOf('class SLocalizationsAr');
  final int
      zhStart =
      content.indexOf('class SLocalizationsZh');

  final String
      enBlock =
      content.substring(enStart,
          frStart);
  final String
      frBlock =
      content.substring(frStart,
          arStart);
  final String
      arBlock =
      content.substring(arStart,
          zhStart);
  final String
      zhBlock =
      content.substring(zhStart);

  Set<String>
      findMembersStrict(String block) {
    final Set<String>
        members =
        <String>{};

    final List<String>
        lines =
        block.split('\n');
    for (int i = 0;
        i < lines.length - 1;
        i++) {
      final String
          line =
          lines[i].trim();
      final String
          nextLine =
          lines[i + 1].trim();

      if (line ==
          'String') {
        if (nextLine.startsWith('get ')) {
          final String name = nextLine.substring(4).replaceAll(';', '').trim();
          members.add(name);
        } else if (nextLine.contains('(')) {
          final String name = nextLine.split('(')[0].trim();
          if (name != 'SLocalizations' && name != 'ofContext') {
            members.add(name);
          }
        }
      }
    }
    return members;
  }

  final Set<String>
      abstractMembers =
      findMembersStrict(abstractBlock);

  void check(
      String
          name,
      String
          block) {
    final Set<String>
        implemented =
        findMembersStrict(block);
    final Set<String>
        missing =
        abstractMembers.difference(implemented);

    if (missing
        .isNotEmpty) {}
  }

  check(
      'En',
      enBlock);
  check(
      'Fr',
      frBlock);
  check(
      'Ar',
      arBlock);
  check(
      'Zh',
      zhBlock);
}
