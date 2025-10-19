import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @amenities.
  ///
  /// In en, this message translates to:
  /// **'Amenities'**
  String get amenities;

  /// No description provided for @appLocale.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLocale;

  /// No description provided for @bathrooms.
  ///
  /// In en, this message translates to:
  /// **'{p1} Bathroom'**
  String bathrooms(Object p1);

  /// No description provided for @baths.
  ///
  /// In en, this message translates to:
  /// **'Baths'**
  String get baths;

  /// No description provided for @bedroom.
  ///
  /// In en, this message translates to:
  /// **'{p1} Bedroom'**
  String bedroom(Object p1);

  /// No description provided for @beds.
  ///
  /// In en, this message translates to:
  /// **'Beds'**
  String get beds;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City: {p1}'**
  String city(Object p1);

  /// No description provided for @cityAZ.
  ///
  /// In en, this message translates to:
  /// **'City A-Z'**
  String get cityAZ;

  /// No description provided for @cityZA.
  ///
  /// In en, this message translates to:
  /// **'City: Z-A'**
  String get cityZA;

  /// No description provided for @clean.
  ///
  /// In en, this message translates to:
  /// **'Clean'**
  String get clean;

  /// No description provided for @cleanCacheTitle.
  ///
  /// In en, this message translates to:
  /// **'Clean app cache'**
  String get cleanCacheTitle;

  /// No description provided for @cleanFilters.
  ///
  /// In en, this message translates to:
  /// **'Clean filters'**
  String get cleanFilters;

  /// No description provided for @confirmClean.
  ///
  /// In en, this message translates to:
  /// **'Confirm Clean'**
  String get confirmClean;

  /// No description provided for @confirmCleanDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear the application cache? This will delete your user data too'**
  String get confirmCleanDescription;

  /// No description provided for @contactSeller.
  ///
  /// In en, this message translates to:
  /// **'Contact Seller'**
  String get contactSeller;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'If you have any other query you can reach out to us.'**
  String get contactUs;

  /// No description provided for @currentLanguage.
  ///
  /// In en, this message translates to:
  /// **'Actual: {p1}'**
  String currentLanguage(Object p1);

  /// No description provided for @dreamProperty.
  ///
  /// In en, this message translates to:
  /// **'dream property'**
  String get dreamProperty;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'English (US)'**
  String get en;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @errorAuthorization.
  ///
  /// In en, this message translates to:
  /// **'You are not authorized to perform this action'**
  String get errorAuthorization;

  /// No description provided for @errorConnection.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connexion'**
  String get errorConnection;

  /// No description provided for @errorCredentials.
  ///
  /// In en, this message translates to:
  /// **'Email or password are incorrect'**
  String get errorCredentials;

  /// No description provided for @errorFilters.
  ///
  /// In en, this message translates to:
  /// **'There not found properties with this filters'**
  String get errorFilters;

  /// No description provided for @errorRequest.
  ///
  /// In en, this message translates to:
  /// **'Your request could not be processed'**
  String get errorRequest;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'The server is not responding'**
  String get errorServer;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'The response is taking too long'**
  String get errorTimeout;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorUnknown;

  /// No description provided for @es.
  ///
  /// In en, this message translates to:
  /// **'Spanish (ES)'**
  String get es;

  /// No description provided for @findYour.
  ///
  /// In en, this message translates to:
  /// **'Find your \n'**
  String get findYour;

  /// No description provided for @higherPrice.
  ///
  /// In en, this message translates to:
  /// **'Higher price ⬇️'**
  String get higherPrice;

  /// No description provided for @highlights.
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get highlights;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @laundryRoom.
  ///
  /// In en, this message translates to:
  /// **'{p1} Laundry Room'**
  String laundryRoom(Object p1);

  /// No description provided for @locateOnMap.
  ///
  /// In en, this message translates to:
  /// **'Locate on map'**
  String get locateOnMap;

  /// No description provided for @loadMore.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// No description provided for @lowerPrice.
  ///
  /// In en, this message translates to:
  /// **'Lower price ⬆️'**
  String get lowerPrice;

  /// No description provided for @noMatches.
  ///
  /// In en, this message translates to:
  /// **'No matches'**
  String get noMatches;

  /// No description provided for @otherFacilities.
  ///
  /// In en, this message translates to:
  /// **'Other Facilities'**
  String get otherFacilities;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchYourProperty.
  ///
  /// In en, this message translates to:
  /// **'Search your property'**
  String get searchYourProperty;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @specifications.
  ///
  /// In en, this message translates to:
  /// **'Specifications'**
  String get specifications;

  /// No description provided for @squareArea.
  ///
  /// In en, this message translates to:
  /// **'{p1} Approx. Sq. Ft.'**
  String squareArea(Object p1);

  /// No description provided for @userProfile.
  ///
  /// In en, this message translates to:
  /// **'User Profile'**
  String get userProfile;

  /// No description provided for @viewPhone.
  ///
  /// In en, this message translates to:
  /// **'View Phone'**
  String get viewPhone;

  /// No description provided for @whatsappUs.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Us'**
  String get whatsappUs;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
