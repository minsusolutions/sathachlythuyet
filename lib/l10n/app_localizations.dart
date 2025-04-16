import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @home_title.
  ///
  /// In en, this message translates to:
  /// **'Sát hạch lái xe'**
  String get home_title;

  /// No description provided for @setting_title.
  ///
  /// In en, this message translates to:
  /// **'Thiết lập'**
  String get setting_title;

  /// No description provided for @app_version.
  ///
  /// In en, this message translates to:
  /// **'Phiên bản ứng dụng: '**
  String get app_version;

  /// No description provided for @randomAssestmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Đề ngẫu nhiên'**
  String get randomAssestmentTitle;

  /// No description provided for @assestmentSetsTitle.
  ///
  /// In en, this message translates to:
  /// **'Thi theo bộ đề'**
  String get assestmentSetsTitle;

  /// No description provided for @wrongAnswersTitle.
  ///
  /// In en, this message translates to:
  /// **'Xem câu bị sai'**
  String get wrongAnswersTitle;

  /// No description provided for @reviseTitle.
  ///
  /// In en, this message translates to:
  /// **'Ôn tập câu hỏi'**
  String get reviseTitle;

  /// No description provided for @signsTitle.
  ///
  /// In en, this message translates to:
  /// **'Các biển báo'**
  String get signsTitle;

  /// No description provided for @tipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Mẹo ghi nhớ'**
  String get tipsTitle;

  /// No description provided for @a60DeadQuestions.
  ///
  /// In en, this message translates to:
  /// **'60 câu điểm liệt'**
  String get a60DeadQuestions;

  /// No description provided for @top50WrongQuestions.
  ///
  /// In en, this message translates to:
  /// **'Top 50 câu sai'**
  String get top50WrongQuestions;

  /// No description provided for @chooseLicienseType.
  ///
  /// In en, this message translates to:
  /// **'Chọn bằng lái xe'**
  String get chooseLicienseType;

  /// No description provided for @a1Title.
  ///
  /// In en, this message translates to:
  /// **'Hạng A1'**
  String get a1Title;

  /// No description provided for @a1Desc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe mô tô hai bánh có dung tích xi-lanh đến 125cm3 hoặc có công suất động cơ điện đến 11kW.'**
  String get a1Desc;

  /// No description provided for @aTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng A'**
  String get aTitle;

  /// No description provided for @aDesc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe mô tô hai bánh có dung tích xi-lanh trên 125cm3 hoặc có công suất động cơ điện trên 11kw và lái xe hạng A1.'**
  String get aDesc;

  /// No description provided for @b1Title.
  ///
  /// In en, this message translates to:
  /// **'Hạng B1'**
  String get b1Title;

  /// No description provided for @b1Desc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe mô tô ba bánh và lái xe hạng A1.'**
  String get b1Desc;

  /// No description provided for @bTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng B'**
  String get bTitle;

  /// No description provided for @bDesc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe ô tô chở người đến 8 chỗ ngồi (không kể chỗ lái xe); xe ô tô tải và chuyên dùng đến 3.500km; xe có kéo rơ moóc đến 750kg.'**
  String get bDesc;

  /// No description provided for @c1Title.
  ///
  /// In en, this message translates to:
  /// **'Hạng C1'**
  String get c1Title;

  /// No description provided for @c1Desc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe ô tô tải và chuyên dùng trên 3.500kg đến 7.500kg; xe có kéo rơ moóc đến 750kg; và lái xe hạng B.'**
  String get c1Desc;

  /// No description provided for @cTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng C'**
  String get cTitle;

  /// No description provided for @cDesc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe ô tô tải và chuyên dùng trên 7.500kg; xe có kéo rơ moóc đến 750kg; và lái xe hạng B và C1.'**
  String get cDesc;

  /// No description provided for @d1Title.
  ///
  /// In en, this message translates to:
  /// **'Hạng D1'**
  String get d1Title;

  /// No description provided for @d1Desc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe ô tô chở người trên 08 chỗ đến 16 chỗ (không kể chỗ lãi xe), xe kéo rơ moóc đến 750kg; và lái xe các hạng B, C1, C.'**
  String get d1Desc;

  /// No description provided for @d2Title.
  ///
  /// In en, this message translates to:
  /// **'Hạng D2'**
  String get d2Title;

  /// No description provided for @d2Desc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe ô tô chở người (kể cả xe buýt) trên 16 chỗ đến 29 chỗ (không kể chỗ lái xe), xe kéo rơ moóc đến 750kg; và lái xe các hạng B, C1, C, D1.'**
  String get d2Desc;

  /// No description provided for @dTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng D'**
  String get dTitle;

  /// No description provided for @dDesc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe ô tô chở người (kể cả xe buýt) trên 29 chỗ (không kể chỗ lái xe); xe giường nằm; xe kéo rơ moóc đến 750kg; và lái xe các hạng B, C1, C, D1, D2.'**
  String get dDesc;

  /// No description provided for @beTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng BE'**
  String get beTitle;

  /// No description provided for @beDesc.
  ///
  /// In en, this message translates to:
  /// **'Lãi xe hạng B kéo rơ moóc trên 750kg.'**
  String get beDesc;

  /// No description provided for @c1eTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng C1E'**
  String get c1eTitle;

  /// No description provided for @c1eDesc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe hạng C1 kéo rơ moóc trên 750kg.'**
  String get c1eDesc;

  /// No description provided for @ceTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng CE'**
  String get ceTitle;

  /// No description provided for @ceDesc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe hạng C kéo rơ moóc trên 750kg, xe ô tô đầu kéo kéo sơ mi rơ moóc.'**
  String get ceDesc;

  /// No description provided for @deTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng DE'**
  String get deTitle;

  /// No description provided for @deDesc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe hạng D kéo rơ moóc trên 750kg; xe ô tô chở khách nối toa.'**
  String get deDesc;

  /// No description provided for @d1eTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng D1E'**
  String get d1eTitle;

  /// No description provided for @d1eDesc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe hạng D1 kéo rơ moóc trên 750kg.'**
  String get d1eDesc;

  /// No description provided for @d2eTitle.
  ///
  /// In en, this message translates to:
  /// **'Hạng D2E'**
  String get d2eTitle;

  /// No description provided for @d2eDesc.
  ///
  /// In en, this message translates to:
  /// **'Lái xe hạng D2 kéo rơ moóc trên 750kg.'**
  String get d2eDesc;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
