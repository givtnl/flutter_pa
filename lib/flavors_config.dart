enum Flavor {
  DEV,
  QA,
  PRODUCTION
}

class FlavorValues {
  FlavorValues({required this.baseUrl});
  final String baseUrl;
  //Add other flavor specific values, e.g database name
}

class FlavorConfig {
  late final Flavor flavor;
  late final FlavorValues values;
  static final FlavorConfig _instance = FlavorConfig._internal();

  FlavorConfig._internal();

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values}) {
    _instance.flavor = flavor;
    _instance.values = values;
    return _instance;
  }

  static FlavorConfig get instance { return _instance;}
  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
  static bool isQA() => _instance.flavor == Flavor.QA;
}