part 'config.g.dart'; //use the <filename>.g.dart, where <filename> is the name of this dart file

@BuildConfiguration([
  ConfigFile(configName: "devConfig", path: "lib/secrets/config.dev.json"),
  ConfigFile(configName: "testConfig", path: "lib/secrets/config.test.json"),
])
class Config{
  final String name;
  final int value;
  final Environment environment;

  const Config({this.name, this.value, this.environment});
}