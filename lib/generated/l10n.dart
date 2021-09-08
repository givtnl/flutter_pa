// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Find out with charities match your values, standards and identity.`
  String get introText {
    return Intl.message(
      'Find out with charities match your values, standards and identity.',
      name: 'introText',
      desc: '',
      args: [],
    );
  }

  /// `To the selection guide!`
  String get introButton {
    return Intl.message(
      'To the selection guide!',
      name: 'introButton',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nextButton {
    return Intl.message(
      'Next',
      name: 'nextButton',
      desc: '',
      args: [],
    );
  }

  /// `Disagree`
  String get choiceScreen_disagree {
    return Intl.message(
      'Disagree',
      name: 'choiceScreen_disagree',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get choiceScreen_agree {
    return Intl.message(
      'Agree',
      name: 'choiceScreen_agree',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get choiceScreen_skip {
    return Intl.message(
      'Skip',
      name: 'choiceScreen_skip',
      desc: '',
      args: [],
    );
  }

  /// `Totally disagree`
  String get choiceScreen_totallyDisagree {
    return Intl.message(
      'Totally disagree',
      name: 'choiceScreen_totallyDisagree',
      desc: '',
      args: [],
    );
  }

  /// `Totally agree`
  String get choiceScreen_totallyAgree {
    return Intl.message(
      'Totally agree',
      name: 'choiceScreen_totallyAgree',
      desc: '',
      args: [],
    );
  }

  /// `Neutral`
  String get choiceScreen_neutral {
    return Intl.message(
      'Neutral',
      name: 'choiceScreen_neutral',
      desc: '',
      args: [],
    );
  }

  /// `Animals`
  String get sectors_animals {
    return Intl.message(
      'Animals',
      name: 'sectors_animals',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get sectors_health {
    return Intl.message(
      'Health',
      name: 'sectors_health',
      desc: '',
      args: [],
    );
  }

  /// `International aid and human rights`
  String get sectors_internationalAidAndHumanRights {
    return Intl.message(
      'International aid and human rights',
      name: 'sectors_internationalAidAndHumanRights',
      desc: '',
      args: [],
    );
  }

  /// `Art and culture`
  String get sectors_artAndCulture {
    return Intl.message(
      'Art and culture',
      name: 'sectors_artAndCulture',
      desc: '',
      args: [],
    );
  }

  /// `Nature and environment`
  String get sectors_natureAndEnvironment {
    return Intl.message(
      'Nature and environment',
      name: 'sectors_natureAndEnvironment',
      desc: '',
      args: [],
    );
  }

  /// `Education and science`
  String get sectors_educationAndScience {
    return Intl.message(
      'Education and science',
      name: 'sectors_educationAndScience',
      desc: '',
      args: [],
    );
  }

  /// `Religion and philosophy`
  String get sectors_religionAndPhilosophy {
    return Intl.message(
      'Religion and philosophy',
      name: 'sectors_religionAndPhilosophy',
      desc: '',
      args: [],
    );
  }

  /// `Well-being`
  String get sectors_wellBeing {
    return Intl.message(
      'Well-being',
      name: 'sectors_wellBeing',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'nl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
