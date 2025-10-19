// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get amenities => 'Amenities';

  @override
  String get appLocale => 'App language';

  @override
  String bathrooms(Object p1) {
    return '$p1 Bathroom';
  }

  @override
  String get baths => 'Baths';

  @override
  String bedroom(Object p1) {
    return '$p1 Bedroom';
  }

  @override
  String get beds => 'Beds';

  @override
  String get cancel => 'Cancel';

  @override
  String get chat => 'Chat';

  @override
  String city(Object p1) {
    return 'City: $p1';
  }

  @override
  String get cityAZ => 'City A-Z';

  @override
  String get cityZA => 'City: Z-A';

  @override
  String get clean => 'Clean';

  @override
  String get cleanCacheTitle => 'Clean app cache';

  @override
  String get cleanFilters => 'Clean filters';

  @override
  String get confirmClean => 'Confirm Clean';

  @override
  String get confirmCleanDescription =>
      'Are you sure you want to clear the application cache? This will delete your user data too';

  @override
  String get contactSeller => 'Contact Seller';

  @override
  String get contactUs =>
      'If you have any other query you can reach out to us.';

  @override
  String currentLanguage(Object p1) {
    return 'Actual: $p1';
  }

  @override
  String get dreamProperty => 'dream property';

  @override
  String get en => 'English (US)';

  @override
  String get error => 'Error';

  @override
  String get errorAuthorization =>
      'You are not authorized to perform this action';

  @override
  String get errorConnection => 'Please check your internet connexion';

  @override
  String get errorCredentials => 'Email or password are incorrect';

  @override
  String get errorFilters => 'There not found properties with this filters';

  @override
  String get errorRequest => 'Your request could not be processed';

  @override
  String get errorServer => 'The server is not responding';

  @override
  String get errorTimeout => 'The response is taking too long';

  @override
  String get errorUnknown => 'Something went wrong';

  @override
  String get es => 'Spanish (ES)';

  @override
  String get findYour => 'Find your \n';

  @override
  String get higherPrice => 'Higher price ⬇️';

  @override
  String get highlights => 'Highlights';

  @override
  String get home => 'Home';

  @override
  String laundryRoom(Object p1) {
    return '$p1 Laundry Room';
  }

  @override
  String get locateOnMap => 'Locate on map';

  @override
  String get loadMore => 'Load more';

  @override
  String get lowerPrice => 'Lower price ⬆️';

  @override
  String get noMatches => 'No matches';

  @override
  String get otherFacilities => 'Other Facilities';

  @override
  String get priceRange => 'Price Range';

  @override
  String get retry => 'Retry';

  @override
  String get search => 'Search';

  @override
  String get searchYourProperty => 'Search your property';

  @override
  String get settings => 'Settings';

  @override
  String get specifications => 'Specifications';

  @override
  String squareArea(Object p1) {
    return '$p1 Approx. Sq. Ft.';
  }

  @override
  String get userProfile => 'User Profile';

  @override
  String get viewPhone => 'View Phone';

  @override
  String get whatsappUs => 'WhatsApp Us';
}
