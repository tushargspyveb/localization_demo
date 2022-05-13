


import 'app_localization.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get language => 'Spanish Language';

  @override
  String get glasses => 'Lentes';
}

/// The translations for Spanish Castilian, as used in Mexico (`es_MX`).
class AppLocalizationsEsMx extends AppLocalizationsEs {
  AppLocalizationsEsMx(): super('es_MX');

  @override
  String get language => 'Mexican Spanish Language';

  @override
  String get glasses => 'Gafas';
}
