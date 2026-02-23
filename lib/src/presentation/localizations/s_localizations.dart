import 'package:flutter/material.dart';

import 's_localizations_delegate.dart';

/// Defines the localized strings for the sDesign component library.
abstract class SLocalizations {
  /// The locale for which these strings are localized.
  final String
      localeName;

  const SLocalizations(
      this.localeName);

  /// Returns the localized resources object for the closest [SLocalizations]
  /// ancestor of the given context.
  ///
  /// If no ancestor is found, it falls back to a default English implementation.
  static SLocalizations
      ofContext(BuildContext context) {
    return Localizations.of<SLocalizations>(context, SLocalizations) ??
        SLocalizationsEn();
  }

  /// A delegate that provides [SLocalizations].
  ///
  /// Include this in your `MaterialApp.localizationsDelegates` to support sDesign localization.
  static const LocalizationsDelegate<SLocalizations>
      delegate =
      SLocalizationsDelegate();

  // ---------------------------------------------------------------------------
  // General / Common Strings
  // ---------------------------------------------------------------------------
  String
      get ok;
  String
      get cancel;
  String
      get done;
  String
      get close;
  String
      get search;
  String
      get searchPlaceholder;
  String
      get selectPlaceholder;
  String
      get noData;
  String
      get loading;

  // ---------------------------------------------------------------------------
  // Date & Time Picker Strings
  // ---------------------------------------------------------------------------
  String
      get selectDate;
  String
      get selectTime;
  String
      get startDate;
  String
      get endDate;
  String
      get startTime;
  String
      get endTime;
  String
      get hour;
  String
      get minute;
  String
      get second;

  // ---------------------------------------------------------------------------
  // Pagination Strings
  // ---------------------------------------------------------------------------
  String
      get previousPage;
  String
      get nextPage;
  String
      get page;
  String
      get of;
}

/// Default English implementation of [SLocalizations].
class SLocalizationsEn
    extends SLocalizations {
  const SLocalizationsEn()
      : super('en');

  @override
  String get ok =>
      'OK';
  @override
  String get cancel =>
      'Cancel';
  @override
  String get done =>
      'Done';
  @override
  String get close =>
      'Close';
  @override
  String get search =>
      'Search';
  @override
  String get searchPlaceholder =>
      'Search...';
  @override
  String get selectPlaceholder =>
      'Select';
  @override
  String get noData =>
      'No data';
  @override
  String get loading =>
      'Loading...';

  @override
  String get selectDate =>
      'Select date';
  @override
  String get selectTime =>
      'Select time';
  @override
  String get startDate =>
      'Start date';
  @override
  String get endDate =>
      'End date';
  @override
  String get startTime =>
      'Start time';
  @override
  String get endTime =>
      'End time';
  @override
  String get hour =>
      'Hour';
  @override
  String get minute =>
      'Minute';
  @override
  String get second =>
      'Second';

  @override
  String get previousPage =>
      'Previous page';
  @override
  String get nextPage =>
      'Next page';
  @override
  String get page =>
      'Page';
  @override
  String get of =>
      'of';
}

/// French implementation of [SLocalizations].
class SLocalizationsFr
    extends SLocalizations {
  const SLocalizationsFr()
      : super('fr');

  @override
  String get ok =>
      'OK';
  @override
  String get cancel =>
      'Annuler';
  @override
  String get done =>
      'Terminé';
  @override
  String get close =>
      'Fermer';
  @override
  String get search =>
      'Rechercher';
  @override
  String get searchPlaceholder =>
      'Rechercher...';
  @override
  String get selectPlaceholder =>
      'Sélectionner';
  @override
  String get noData =>
      'Aucune donnée';
  @override
  String get loading =>
      'Chargement...';

  @override
  String get selectDate =>
      'Sélectionner une date';
  @override
  String get selectTime =>
      'Sélectionner une heure';
  @override
  String get startDate =>
      'Date de début';
  @override
  String get endDate =>
      'Date de fin';
  @override
  String get startTime =>
      'Heure de début';
  @override
  String get endTime =>
      'Heure de fin';
  @override
  String get hour =>
      'Heure';
  @override
  String get minute =>
      'Minute';
  @override
  String get second =>
      'Seconde';

  @override
  String get previousPage =>
      'Page précédente';
  @override
  String get nextPage =>
      'Page suivante';
  @override
  String get page =>
      'Page';
  @override
  String get of =>
      'sur';
}

/// Arabic implementation of [SLocalizations].
class SLocalizationsAr
    extends SLocalizations {
  const SLocalizationsAr()
      : super('ar');

  @override
  String get ok =>
      'موافق';
  @override
  String get cancel =>
      'إلغاء';
  @override
  String get done =>
      'تم';
  @override
  String get close =>
      'إغلاق';
  @override
  String get search =>
      'بحث';
  @override
  String get searchPlaceholder =>
      'بحث...';
  @override
  String get selectPlaceholder =>
      'اختر';
  @override
  String get noData =>
      'لا توجد بيانات';
  @override
  String get loading =>
      'جار التحميل...';

  @override
  String get selectDate =>
      'اختر التاريخ';
  @override
  String get selectTime =>
      'اختر الوقت';
  @override
  String get startDate =>
      'تاريخ البدء';
  @override
  String get endDate =>
      'تاريخ الانتهاء';
  @override
  String get startTime =>
      'وقت البدء';
  @override
  String get endTime =>
      'وقت الانتهاء';
  @override
  String get hour =>
      'ساعة';
  @override
  String get minute =>
      'دقيقة';
  @override
  String get second =>
      'ثانية';

  @override
  String get previousPage =>
      'الصفحة السابقة';
  @override
  String get nextPage =>
      'الصفحة التالية';
  @override
  String get page =>
      'صفحة';
  @override
  String get of =>
      'من';
}

/// Chinese implementation of [SLocalizations].
class SLocalizationsZh
    extends SLocalizations {
  const SLocalizationsZh()
      : super('zh');

  @override
  String get ok =>
      '确定';
  @override
  String get cancel =>
      '取消';
  @override
  String get done =>
      '完成';
  @override
  String get close =>
      '关闭';
  @override
  String get search =>
      '搜索';
  @override
  String get searchPlaceholder =>
      '搜索...';
  @override
  String get selectPlaceholder =>
      '请选择';
  @override
  String get noData =>
      '暂无数据';
  @override
  String get loading =>
      '加载中...';

  @override
  String get selectDate =>
      '选择日期';
  @override
  String get selectTime =>
      '选择时间';
  @override
  String get startDate =>
      '开始日期';
  @override
  String get endDate =>
      '结束日期';
  @override
  String get startTime =>
      '开始时间';
  @override
  String get endTime =>
      '结束时间';
  @override
  String get hour =>
      '时';
  @override
  String get minute =>
      '分';
  @override
  String get second =>
      '秒';

  @override
  String get previousPage =>
      '上一页';
  @override
  String get nextPage =>
      '下一页';
  @override
  String get page =>
      '页';
  @override
  String get of =>
      '/';
}
