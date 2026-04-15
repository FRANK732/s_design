import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 's_localizations.dart';

/// A delegate factory for [SLocalizations].
class SLocalizationsDelegate
    extends LocalizationsDelegate<
        SLocalizations> {
  const SLocalizationsDelegate();

  /// Adds robust multi-language support by allowing package users
  /// to provide custom language maps or overriding standard languages.
  static final Map<String,
          SLocalizations>
      _supportedLanguages =
      <String,
          SLocalizations>{
    'en':
        const SLocalizationsEn(),
    'fr':
        const SLocalizationsFr(),
    'ar':
        const SLocalizationsAr(),
    'zh':
        const SLocalizationsZh(),
  };

  /// Register a new language or override an existing one.
  static void registerLanguage(
      String
          languageCode,
      SLocalizations
          localizations) {
    _supportedLanguages[languageCode] =
        localizations;
  }

  @override
  bool isSupported(Locale locale) =>
      _supportedLanguages.containsKey(locale.languageCode);

  @override
  Future<SLocalizations>
      load(Locale locale) {
    return SynchronousFuture<SLocalizations>(_supportedLanguages[locale.languageCode] ??
        const SLocalizationsEn());
  }

  @override
  bool shouldReload(SLocalizationsDelegate old) =>
      true;
}
