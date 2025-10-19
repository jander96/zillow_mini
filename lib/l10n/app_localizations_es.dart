// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get amenities => 'Comodidades';

  @override
  String get appLocale => 'Idioma de la Aplicación';

  @override
  String bathrooms(Object p1) {
    return '$p1 Baño';
  }

  @override
  String get baths => 'Baños';

  @override
  String bedroom(Object p1) {
    return '$p1 Dormitorio';
  }

  @override
  String get beds => 'Camas';

  @override
  String get cancel => 'Cancelar';

  @override
  String get chat => 'Chat';

  @override
  String city(Object p1) {
    return 'Ciudad: $p1';
  }

  @override
  String get cityAZ => 'Ciudad: A-Z';

  @override
  String get cityZA => 'Ciudad: Z-A';

  @override
  String get clean => 'Limpiar';

  @override
  String get cleanCacheTitle => 'Limpiar caché de la aplicación';

  @override
  String get cleanFilters => 'Limpiar filtros';

  @override
  String get confirmClean => 'Confirmar Limpieza';

  @override
  String get confirmCleanDescription =>
      '¿Estás seguro de que quieres eliminar la caché de la aplicación? Esto eliminará tus datos de usuario tambien.';

  @override
  String get contactSeller => 'Contactar al Vendedor';

  @override
  String get contactUs =>
      'Si tienes cualquier otra consulta, puedes contactarnos.';

  @override
  String currentLanguage(Object p1) {
    return 'Actual: $p1';
  }

  @override
  String get dreamProperty => 'propiedad soñada';

  @override
  String get en => 'Inglés (US)';

  @override
  String get error => 'Error';

  @override
  String get errorAuthorization =>
      'No está autorizado para realizar esta acción';

  @override
  String get errorConnection => 'Por favor, comprueba tu conexión a Internet';

  @override
  String get errorCredentials =>
      'El correo electrónico o la contraseña son incorrectos';

  @override
  String get errorFilters => 'No se encontraron propiedades con estos filtros';

  @override
  String get errorRequest => 'No se pudo procesar la solicitud';

  @override
  String get errorServer => 'El servidor no responde';

  @override
  String get errorTimeout => 'La respuesta está tardando demasiado';

  @override
  String get errorUnknown => 'Algo salió mal';

  @override
  String get es => 'Español (ES)';

  @override
  String get findYour => 'Encuentra tu \n';

  @override
  String get higherPrice => 'Precio: Más alto ⬇️';

  @override
  String get highlights => 'Aspectos Destacados';

  @override
  String get home => 'Inicio';

  @override
  String laundryRoom(Object p1) {
    return '$p1 Cuarto de Lavado';
  }

  @override
  String get locateOnMap => 'Localizar en el mapa';

  @override
  String get loadMore => 'Cargar más';

  @override
  String get lowerPrice => 'Precio: Más bajo ⬆️';

  @override
  String get noMatches => 'Sin resultados';

  @override
  String get otherFacilities => 'Otras Instalaciones';

  @override
  String get priceRange => 'Rango de Precios';

  @override
  String get retry => 'Reintentar';

  @override
  String get search => 'Buscar';

  @override
  String get searchYourProperty => 'Busca tu propiedad';

  @override
  String get settings => 'Configuración';

  @override
  String get specifications => 'Especificaciones';

  @override
  String squareArea(Object p1) {
    return '$p1 Aprox. Pies Cuadrados';
  }

  @override
  String get userProfile => 'Perfil de Usuario';

  @override
  String get viewPhone => 'Ver Teléfono';

  @override
  String get whatsappUs => 'Contáctanos por WhatsApp';
}
