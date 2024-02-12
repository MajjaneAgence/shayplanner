import 'english.dart';
import 'french.dart';
import 'arabic.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": en,
    "fr": fr,
    "ar": ar
  };
}
