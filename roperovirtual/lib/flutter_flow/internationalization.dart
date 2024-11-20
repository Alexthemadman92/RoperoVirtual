import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Iniciodesesion
  {
    'o07j3mgv': {
      'es': 'ROPERO VIRTUAL',
      'en': '',
    },
    'fteochu4': {
      'es': 'BIENVENIDO ',
      'en': '',
    },
    'fzxvw3mu': {
      'es': 'Inicia seción para continuar',
      'en': '',
    },
    'a9j78va9': {
      'es': 'Correo Electronico',
      'en': '',
    },
    'i7f18cve': {
      'es': 'Ingresa tu correo electronico',
      'en': '',
    },
    'wztjmbn8': {
      'es': 'Contraseña',
      'en': '',
    },
    'xwh1r64q': {
      'es': 'Ingresa tu contraseña',
      'en': '',
    },
    'm2xyjvuf': {
      'es': 'Olvidaste tu contraseña?',
      'en': '',
    },
    'qbmoi1av': {
      'es': 'Iniciar sesión',
      'en': '',
    },
    'cjqb8ial': {
      'es': 'No tienes cuenta?',
      'en': '',
    },
    'a0iimirx': {
      'es': 'Crear',
      'en': '',
    },
    '2bb3vct7': {
      'es': 'Home',
      'en': '',
    },
  },
  // crearcuenta
  {
    'gpokmd81': {
      'es': 'Get Started',
      'en': '',
    },
    'oitrrwgg': {
      'es': 'Create your account below.',
      'en': '',
    },
    'gcwdqm4g': {
      'es': 'Email Address',
      'en': '',
    },
    'iam0xgwx': {
      'es': 'Enter your email...',
      'en': '',
    },
    'bqv15dcf': {
      'es': 'Password',
      'en': '',
    },
    'joih97mn': {
      'es': 'Enter your password...',
      'en': '',
    },
    'rzpiwq9p': {
      'es': 'Confirm Password',
      'en': '',
    },
    'eyfkffka': {
      'es': 'Enter your password...',
      'en': '',
    },
    '5kmjfwsk': {
      'es': 'Create Account',
      'en': '',
    },
    '3twynvfz': {
      'es': 'Login',
      'en': '',
    },
    '9ssznj0g': {
      'es': 'Already have an account?',
      'en': '',
    },
    'momge5oj': {
      'es': 'Home',
      'en': '',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'es': 'Complete Profile',
      'en': '',
    },
    'r6npjsue': {
      'es': 'Upload a photo for us to easily identify you.',
      'en': '',
    },
    'sdptn7dd': {
      'es': 'Your Name',
      'en': '',
    },
    'n636qnrx': {
      'es': 'Your Age',
      'en': '',
    },
    's7yvjzbs': {
      'es': 'i.e. 34',
      'en': '',
    },
    '72ii0waq': {
      'es': 'Your Title',
      'en': '',
    },
    'pf8glhkg': {
      'es': 'What is your position?',
      'en': '',
    },
    'hbhd3bdt': {
      'es': 'Complete Profile',
      'en': '',
    },
    'w75dikic': {
      'es': 'Skip for Now',
      'en': '',
    },
    '1eac148w': {
      'es': 'Field is required',
      'en': '',
    },
    'ew7dbn3s': {
      'es': 'Field is required',
      'en': '',
    },
    'jhhlgzk5': {
      'es': 'Field is required',
      'en': '',
    },
    '4k3jnl38': {
      'es': 'Home',
      'en': '',
    },
  },
  // OlvidasteTuContrasena
  {
    'g416xg9f': {
      'es': 'Forgot Password',
      'en': '',
    },
    'xaiad71o': {
      'es':
          'Enter the email associated with your account and we will send you a verification code.',
      'en': '',
    },
    'u4nuk910': {
      'es': 'Email Address',
      'en': '',
    },
    '37kotxi0': {
      'es': 'Enter your email...',
      'en': '',
    },
    'hiwpaze1': {
      'es': 'Send Reset Link',
      'en': '',
    },
    '598b8d3m': {
      'es': 'Home',
      'en': '',
    },
  },
  // Inicio
  {
    'cd0zp71n': {
      'es': 'Inicio',
      'en': '',
    },
    'ofz2zvlc': {
      'es': '•',
      'en': '',
    },
  },
  // PerfilUsuario
  {
    'f1bvbey3': {
      'es': 'My Account',
      'en': '',
    },
    'i61y9ibx': {
      'es': 'Edit Profile',
      'en': '',
    },
    '03k0vw86': {
      'es': 'Change Password',
      'en': '',
    },
    '6w6wv95p': {
      'es': 'Notification Settings',
      'en': '',
    },
    '9aogde79': {
      'es': 'Tutorial',
      'en': '',
    },
    'eojlfs66': {
      'es': 'Privacy Policy',
      'en': '',
    },
    '2ll42t1u': {
      'es': 'Dark Mode',
      'en': '',
    },
    '8d386226': {
      'es': 'Light Mode',
      'en': '',
    },
    '8srr2k0j': {
      'es': '•',
      'en': '',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'es': 'Edit Profile',
      'en': '',
    },
    'zoxan2gi': {
      'es': 'Change Photo',
      'en': '',
    },
    '3p9y21e2': {
      'es': 'Your Name',
      'en': '',
    },
    'dw9gmjdc': {
      'es': 'Please enter a valid number...',
      'en': '',
    },
    'z4fstn5l': {
      'es': 'Email Address',
      'en': '',
    },
    'jozgvwyg': {
      'es': 'Your email',
      'en': '',
    },
    '8h1cjk5a': {
      'es': 'Your Age',
      'en': '',
    },
    '5v21r6gb': {
      'es': 'i.e. 34',
      'en': '',
    },
    'zvymbfia': {
      'es': 'Your Title',
      'en': '',
    },
    'i6edcl52': {
      'es': 'Save Changes',
      'en': '',
    },
    '59naq8ur': {
      'es': 'Home',
      'en': '',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'es': 'Change Password',
      'en': '',
    },
    '2b97u8y5': {
      'es':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'en': '',
    },
    'ajy1c3r9': {
      'es': 'Email Address',
      'en': '',
    },
    'hsqfoxya': {
      'es': 'Enter your email...',
      'en': '',
    },
    'if4pz6lm': {
      'es': 'Send Reset Link',
      'en': '',
    },
    '5tvk9lv0': {
      'es': 'Home',
      'en': '',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'es': 'Notifications',
      'en': '',
    },
    'r72zvrv5': {
      'es':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'en': '',
    },
    'gjygkr0n': {
      'es': 'Push Notifications',
      'en': '',
    },
    '3y3yhxbk': {
      'es':
          'Receive Push notifications from our application on a semi regular basis.',
      'en': '',
    },
    '1ytebj35': {
      'es': 'Email Notifications',
      'en': '',
    },
    '9lvh5nst': {
      'es':
          'Receive email notifications from our marketing team about new features.',
      'en': '',
    },
    '69d2j74u': {
      'es': 'Location Services',
      'en': '',
    },
    '3k8cuv0d': {
      'es':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'en': '',
    },
    'isgrgbfs': {
      'es': 'Save Changes',
      'en': '',
    },
    'a96mlyeh': {
      'es': 'Home',
      'en': '',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'es': 'Privacy Policy',
      'en': '',
    },
    'fvsfg5on': {
      'es': 'How we use your data',
      'en': '',
    },
    'nbiyrnzl': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'en': '',
    },
    'oks4x95o': {
      'es': 'Home',
      'en': '',
    },
  },
  // tutorial_PROFILE
  {
    '38wb3rix': {
      'es': 'Tutorial',
      'en': '',
    },
    'o6prpb1q': {
      'es': 'Create Budgets',
      'en': '',
    },
    '292pbdw7': {
      'es':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'en': '',
    },
    'b10xvuf9': {
      'es': 'Keep Track of Spending',
      'en': '',
    },
    't6k1smsm': {
      'es':
          'Easily add transactions and associate them with budgets that have been created.',
      'en': '',
    },
    'u8xxj427': {
      'es': 'Budget Analysis',
      'en': '',
    },
    'iqi0pkmb': {
      'es': 'Know where your budgets are and how they can be adjusted.',
      'en': '',
    },
    'uydm0fnm': {
      'es': 'Home',
      'en': '',
    },
  },
  // Armario
  {
    'ba9fbngp': {
      'es': 'Mi Armario ',
      'en': '',
    },
    'qe8pr1di': {
      'es': 'Ropa Superior',
      'en': '',
    },
    'o1rx83ol': {
      'es': 'Ropa Inferior',
      'en': '',
    },
    'rn8zrhg1': {
      'es': 'Calzado',
      'en': '',
    },
    'jffsgrv2': {
      'es': 'Ropa interior y básicos',
      'en': '',
    },
    'gqe7bkc7': {
      'es': 'Accesorios',
      'en': '',
    },
    'bfhhbhod': {
      'es': 'Light Mode',
      'en': '',
    },
    'msdkcvin': {
      'es': 'Extras Opcionales',
      'en': '',
    },
    'eruzhal7': {
      'es': '•',
      'en': '',
    },
  },
  // RopaSuperior
  {
    'iqfav8nt': {
      'es': 'Ropa Superior',
      'en': '',
    },
    'szr1wdt9': {
      'es': 'Camisetas básicas',
      'en': '',
    },
    '6htljf3t': {
      'es': 'Camisas casuales',
      'en': '',
    },
    'a79dippr': {
      'es': 'Camisas formales',
      'en': '',
    },
    'r3cp6lym': {
      'es': 'Suéteres o sudaderas',
      'en': '',
    },
    'ntivq6le': {
      'es': 'Chaqueta de cuero o denim',
      'en': '',
    },
    'tbg0ogy2': {
      'es': 'Light Mode',
      'en': '',
    },
    '7tagh8hu': {
      'es': 'Blazer o saco',
      'en': '',
    },
    'zdxk2jmc': {
      'es': 'Abrigo o parka',
      'en': '',
    },
    'h7x34gj8': {
      'es': '•',
      'en': '',
    },
  },
  // RopaInferior
  {
    'cscncya0': {
      'es': 'Ropa Inferior',
      'en': '',
    },
    'r5t8nusy': {
      'es': 'Jeans',
      'en': '',
    },
    'a8xetlwr': {
      'es': 'Pantalones chinos',
      'en': '',
    },
    'ihm8pyxn': {
      'es': 'Pantalones formales',
      'en': '',
    },
    'oh0qugcd': {
      'es': 'Shorts casuales',
      'en': '',
    },
    '5lncavr2': {
      'es': 'Pantalones deportivos o joggers',
      'en': '',
    },
    '2qg9xy3p': {
      'es': 'Light Mode',
      'en': '',
    },
    '8neitpig': {
      'es': '•',
      'en': '',
    },
  },
  // Calzado
  {
    'vzhz22cb': {
      'es': 'Calzado',
      'en': '',
    },
    'w19xej6t': {
      'es': 'Zapatillas deportivas',
      'en': '',
    },
    'krmoear1': {
      'es': 'Botas casuales o de cuero',
      'en': '',
    },
    'hfllcd2e': {
      'es': 'Zapatos formales',
      'en': '',
    },
    '9gkrgyi3': {
      'es': 'Sandalias o chanclas',
      'en': '',
    },
    's0ah7o3s': {
      'es': 'Light Mode',
      'en': '',
    },
    '6fdxygw7': {
      'es': '•',
      'en': '',
    },
  },
  // RopaInteriorYBasicos
  {
    '9pr9fd09': {
      'es': 'Ropa Interior y Básicos',
      'en': '',
    },
    't74mlphu': {
      'es': 'Calcetines',
      'en': '',
    },
    'ep2ze1dz': {
      'es': 'Ropa interior',
      'en': '',
    },
    'srgz2xzw': {
      'es': 'Camisetas interiores',
      'en': '',
    },
    'bwxltth7': {
      'es': 'Ropa de dormir o pijamas',
      'en': '',
    },
    'tp8mqwvj': {
      'es': 'Light Mode',
      'en': '',
    },
    'nb9m7blo': {
      'es': '•',
      'en': '',
    },
  },
  // Accesorios
  {
    'm0gt9r2b': {
      'es': 'Accesorios',
      'en': '',
    },
    '6zbj2ip1': {
      'es': 'Reloj',
      'en': '',
    },
    'lvgnf5rf': {
      'es': 'Gafas de sol',
      'en': '',
    },
    '2k84vdl6': {
      'es': 'Bufandas',
      'en': '',
    },
    'lc9vb1c4': {
      'es': 'Cinturón ',
      'en': '',
    },
    'ifg37xnt': {
      'es': 'Mochila o bolso casual',
      'en': '',
    },
    'izh0ta2v': {
      'es': 'Light Mode',
      'en': '',
    },
    '4udt4nr9': {
      'es': 'Gorra o sombrero',
      'en': '',
    },
    'rk6bwgup': {
      'es': '•',
      'en': '',
    },
  },
  // ExtrasOpcionales
  {
    'scix0ymu': {
      'es': 'Extras Opcionales',
      'en': '',
    },
    'bhqozn7e': {
      'es': 'Traje completo',
      'en': '',
    },
    'mfvfuozu': {
      'es': 'Chaleco acolchado o impermeable',
      'en': '',
    },
    'ajoenib5': {
      'es': 'Guantes para el frío',
      'en': '',
    },
    'ovltk0hd': {
      'es': 'Bufanda o pañuelos para el cuello',
      'en': '',
    },
    'muc3dmwy': {
      'es': 'Sudaderas con capucha',
      'en': '',
    },
    '2ftzjd6b': {
      'es': 'Light Mode',
      'en': '',
    },
    'fipsagxo': {
      'es': '•',
      'en': '',
    },
  },
  // galeria
  {
    'tj8ft2so': {
      'es': 'Galeria',
      'en': '',
    },
    'nx84gaic': {
      'es': 'Home',
      'en': '',
    },
  },
  // CargaDePrenda
  {
    'q3v7ud5l': {
      'es': 'Nueva Prenda',
      'en': '',
    },
    '1ltm2f8g': {
      'es': 'Carga una foto de la prenda nueva',
      'en': '',
    },
    'bk0x2rgi': {
      'es': 'Ropa Superior',
      'en': '',
    },
    'lpp0kogh': {
      'es': 'Ropa Inferior',
      'en': '',
    },
    '25xfmxpf': {
      'es': 'Calzado',
      'en': '',
    },
    'p1mk8jl3': {
      'es': 'Ropa Interior y Básicos',
      'en': '',
    },
    'yybey3m8': {
      'es': 'Accesorios',
      'en': '',
    },
    'dt4ue5ql': {
      'es': 'Extras Opcionales',
      'en': '',
    },
    'xl1uh4zl': {
      'es': 'Seleccione tipo de prenda',
      'en': '',
    },
    'sa56xmvn': {
      'es': 'Search...',
      'en': '',
    },
    '4j7im22a': {
      'es': 'Seleccione nombre de prenda',
      'en': '',
    },
    'rr2h263i': {
      'es': 'Search...',
      'en': '',
    },
    '3bsfdrn6': {
      'es': 'Descripción',
      'en': '',
    },
    'rjt9avzk': {
      'es': 'Cargar Nueva Prenda',
      'en': '',
    },
    '0gjce5qd': {
      'es': 'Cancelar',
      'en': '',
    },
    'y8a5nto9': {
      'es': 'Field is required',
      'en': '',
    },
    'vhr1g1xm': {
      'es': 'Field is required',
      'en': '',
    },
    'nvqquy1t': {
      'es': 'Field is required',
      'en': '',
    },
    'ywsu3qz2': {
      'es': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'es': '',
      'en': '',
    },
    'kx9cdks4': {
      'es': '',
      'en': '',
    },
    'efvtwj7k': {
      'es': '',
      'en': '',
    },
    'ec5hfa1e': {
      'es': '',
      'en': '',
    },
    'q5ljwvfo': {
      'es': '',
      'en': '',
    },
    'j4rmwb3h': {
      'es': '',
      'en': '',
    },
    '6ah1b18f': {
      'es': '',
      'en': '',
    },
    '2kos1hen': {
      'es': '',
      'en': '',
    },
    'ake71eau': {
      'es': '',
      'en': '',
    },
    'cxdbx6pb': {
      'es': '',
      'en': '',
    },
    'ecuap8tl': {
      'es': '',
      'en': '',
    },
    'db4vckaf': {
      'es': '',
      'en': '',
    },
    'te8cy0u7': {
      'es': '',
      'en': '',
    },
    'aox3s4fb': {
      'es': '',
      'en': '',
    },
    'l8hv5a7z': {
      'es': '',
      'en': '',
    },
    '4pjwb70a': {
      'es': '',
      'en': '',
    },
    '0xlokf4y': {
      'es': '',
      'en': '',
    },
    '8twlwiwt': {
      'es': '',
      'en': '',
    },
    'qbhxl5rc': {
      'es': '',
      'en': '',
    },
    'gc75k4lw': {
      'es': '',
      'en': '',
    },
    'cmb30dsj': {
      'es': '',
      'en': '',
    },
    '1jpvimu7': {
      'es': '',
      'en': '',
    },
    'vi0k2mc4': {
      'es': '',
      'en': '',
    },
    'yg11evdv': {
      'es': '',
      'en': '',
    },
    't4xzlq9q': {
      'es': '',
      'en': '',
    },
    '513nj4m0': {
      'es': '',
      'en': '',
    },
    'a1jxfgju': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
