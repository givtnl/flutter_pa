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

  /// `Discover in just 2 minutes with which goals you feel the most connected.`
  String get introText {
    return Intl.message(
      'Discover in just 2 minutes with which goals you feel the most connected.',
      name: 'introText',
      desc: '',
      args: [],
    );
  }

  /// `to the Givt Wizard`
  String get introButton {
    return Intl.message(
      'to the Givt Wizard',
      name: 'introButton',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get nextButton {
    return Intl.message(
      'next',
      name: 'nextButton',
      desc: '',
      args: [],
    );
  }

  /// `disagree`
  String get choiceScreen_disagree {
    return Intl.message(
      'disagree',
      name: 'choiceScreen_disagree',
      desc: '',
      args: [],
    );
  }

  /// `agree`
  String get choiceScreen_agree {
    return Intl.message(
      'agree',
      name: 'choiceScreen_agree',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get choiceScreen_skip {
    return Intl.message(
      'skip',
      name: 'choiceScreen_skip',
      desc: '',
      args: [],
    );
  }

  /// `totally disagree`
  String get choiceScreen_totallyDisagree {
    return Intl.message(
      'totally disagree',
      name: 'choiceScreen_totallyDisagree',
      desc: '',
      args: [],
    );
  }

  /// `totally agree`
  String get choiceScreen_totallyAgree {
    return Intl.message(
      'totally agree',
      name: 'choiceScreen_totallyAgree',
      desc: '',
      args: [],
    );
  }

  /// `neutral`
  String get choiceScreen_neutral {
    return Intl.message(
      'neutral',
      name: 'choiceScreen_neutral',
      desc: '',
      args: [],
    );
  }

  /// `animals`
  String get sectors_animals {
    return Intl.message(
      'animals',
      name: 'sectors_animals',
      desc: '',
      args: [],
    );
  }

  /// `health`
  String get sectors_health {
    return Intl.message(
      'health',
      name: 'sectors_health',
      desc: '',
      args: [],
    );
  }

  /// `international aid and human rights`
  String get sectors_internationalAidAndHumanRights {
    return Intl.message(
      'international aid and human rights',
      name: 'sectors_internationalAidAndHumanRights',
      desc: '',
      args: [],
    );
  }

  /// `art and culture`
  String get sectors_artAndCulture {
    return Intl.message(
      'art and culture',
      name: 'sectors_artAndCulture',
      desc: '',
      args: [],
    );
  }

  /// `nature and environment`
  String get sectors_natureAndEnvironment {
    return Intl.message(
      'nature and environment',
      name: 'sectors_natureAndEnvironment',
      desc: '',
      args: [],
    );
  }

  /// `education and science`
  String get sectors_educationAndScience {
    return Intl.message(
      'education and science',
      name: 'sectors_educationAndScience',
      desc: '',
      args: [],
    );
  }

  /// `religion and philosophy`
  String get sectors_religionAndPhilosophy {
    return Intl.message(
      'religion and philosophy',
      name: 'sectors_religionAndPhilosophy',
      desc: '',
      args: [],
    );
  }

  /// `well-being`
  String get sectors_wellBeing {
    return Intl.message(
      'well-being',
      name: 'sectors_wellBeing',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the Givt Wizard!`
  String get introTitle {
    return Intl.message(
      'Welcome to the Givt Wizard!',
      name: 'introTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your personal suggestions`
  String get matchesScreen_yourPersonalSuggestions {
    return Intl.message(
      'Your personal suggestions',
      name: 'matchesScreen_yourPersonalSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `These organisations best match your values, norms and identity.`
  String get matchesScreen_subtitleText {
    return Intl.message(
      'These organisations best match your values, norms and identity.',
      name: 'matchesScreen_subtitleText',
      desc: '',
      args: [],
    );
  }

  /// `match`
  String get matchCircle_match {
    return Intl.message(
      'match',
      name: 'matchCircle_match',
      desc: '',
      args: [],
    );
  }

  /// `discover more`
  String get matchesScreen_findOutMore {
    return Intl.message(
      'discover more',
      name: 'matchesScreen_findOutMore',
      desc: '',
      args: [],
    );
  }

  /// `Mission`
  String get organisationDetailScreen_mission {
    return Intl.message(
      'Mission',
      name: 'organisationDetailScreen_mission',
      desc: '',
      args: [],
    );
  }

  /// `Vision`
  String get organisationDetailScreen_vision {
    return Intl.message(
      'Vision',
      name: 'organisationDetailScreen_vision',
      desc: '',
      args: [],
    );
  }

  /// `visit the website`
  String get organisationDetailScreen_visitWebsite {
    return Intl.message(
      'visit the website',
      name: 'organisationDetailScreen_visitWebsite',
      desc: '',
      args: [],
    );
  }

  /// `You match!`
  String get organisationDetailScreen_youMatchTitle {
    return Intl.message(
      'You match!',
      name: 'organisationDetailScreen_youMatchTitle',
      desc: '',
      args: [],
    );
  }

  /// `This matters to you both:`
  String get organisationDetailScreen_youMatchSubTitle {
    return Intl.message(
      'This matters to you both:',
      name: 'organisationDetailScreen_youMatchSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `give`
  String get organisationDetailScreen_giveButton {
    return Intl.message(
      'give',
      name: 'organisationDetailScreen_giveButton',
      desc: '',
      args: [],
    );
  }

  /// `Which subjects matter to you?`
  String get categoryScreenTitleQuestion {
    return Intl.message(
      'Which subjects matter to you?',
      name: 'categoryScreenTitleQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Please wait...`
  String get loadingTitle {
    return Intl.message(
      'Please wait...',
      name: 'loadingTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can select multiple subjects.`
  String get categoryScreenSubtitle {
    return Intl.message(
      'You can select multiple subjects.',
      name: 'categoryScreenSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `We're fetching the questions!`
  String get fetchingQuestions {
    return Intl.message(
      'We\'re fetching the questions!',
      name: 'fetchingQuestions',
      desc: '',
      args: [],
    );
  }

  /// `We're calculating your matches!`
  String get calculatingMatches {
    return Intl.message(
      'We\'re calculating your matches!',
      name: 'calculatingMatches',
      desc: '',
      args: [],
    );
  }

  /// `Givt Wizard`
  String get app_mainTitle {
    return Intl.message(
      'Givt Wizard',
      name: 'app_mainTitle',
      desc: '',
      args: [],
    );
  }

  /// `No worries, we don't need any personal information!`
  String get introPrivacyPolicyLink {
    return Intl.message(
      'No worries, we don\'t need any personal information!',
      name: 'introPrivacyPolicyLink',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicyTitle {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `We do not use cookies on the device you use to go through the Givt Wizard. We also do not collect personal data from IP addresses.\n\nThe choices you make are sent to the server without personal identification and we also export which buttons you press. In this way we learn more about how the Givt Wizard is used. And all of that is completely anonymous.\n\nAt the end of the Givt Wizard you will get a result that you can only ask again later if you leave your email address. Which you are not obliged to.\n\nIf you leave an e-mail address, there is a chance that you will receive an e-mail from us asking us to help us improve Givt's service.\n\nDo you want to know more about what this service entails? Visit our website: `
  String get privacyPolicy_Pt1 {
    return Intl.message(
      'We do not use cookies on the device you use to go through the Givt Wizard. We also do not collect personal data from IP addresses.\n\nThe choices you make are sent to the server without personal identification and we also export which buttons you press. In this way we learn more about how the Givt Wizard is used. And all of that is completely anonymous.\n\nAt the end of the Givt Wizard you will get a result that you can only ask again later if you leave your email address. Which you are not obliged to.\n\nIf you leave an e-mail address, there is a chance that you will receive an e-mail from us asking us to help us improve Givt\'s service.\n\nDo you want to know more about what this service entails? Visit our website: ',
      name: 'privacyPolicy_Pt1',
      desc: '',
      args: [],
    );
  }

  /// `Wat vind je van de Givt Wizard?`
  String get feedbackWidget_title {
    return Intl.message(
      'Wat vind je van de Givt Wizard?',
      name: 'feedbackWidget_title',
      desc: '',
      args: [],
    );
  }

  /// `Hoe zou je je ervaring met de Givt Wizard beoordelen?`
  String get feedbackWidget_subTitle {
    return Intl.message(
      'Hoe zou je je ervaring met de Givt Wizard beoordelen?',
      name: 'feedbackWidget_subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Jouw feedback geeft ons richting`
  String get feedbackEmailWidget_title {
    return Intl.message(
      'Jouw feedback geeft ons richting',
      name: 'feedbackEmailWidget_title',
      desc: '',
      args: [],
    );
  }

  /// `Vul je e-mailadres in en we contacteren je voor een gesprekje.`
  String get feedbackEmailWidget_subTitle {
    return Intl.message(
      'Vul je e-mailadres in en we contacteren je voor een gesprekje.',
      name: 'feedbackEmailWidget_subTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ik wil helpen!`
  String get feedbackEmailWidget_mainButton {
    return Intl.message(
      'Ik wil helpen!',
      name: 'feedbackEmailWidget_mainButton',
      desc: '',
      args: [],
    );
  }

  /// `www.givt.co.uk`
  String get privacyPolicy_Pt2_website {
    return Intl.message(
      'www.givt.co.uk',
      name: 'privacyPolicy_Pt2_website',
      desc: '',
      args: [],
    );
  }

  /// `or send us an email at `
  String get privacyPolicy_Pt3 {
    return Intl.message(
      'or send us an email at ',
      name: 'privacyPolicy_Pt3',
      desc: '',
      args: [],
    );
  }

  /// `info@givtapp.net`
  String get privacyPolicy_Pt4_email {
    return Intl.message(
      'info@givtapp.net',
      name: 'privacyPolicy_Pt4_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get feedbackEmailWidget_nonValidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'feedbackEmailWidget_nonValidEmail',
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
