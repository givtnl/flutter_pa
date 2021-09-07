import 'package:flutter_app/generated/l10n.dart';

/// This has to be maintained by hand!!!!

extension Sector on S {
  getSector(String sector) {
    switch (sector) {
      case "animals":
        return this.sectors_animals;
      case "artAndCulture":
        return this.sectors_artAndCulture;
      case "educationAndScience":
        return this.sectors_educationAndScience;
      case "health":
        return this.sectors_health;
      case "internationalAidAndHumanRights":
        return this.sectors_internationalAidAndHumanRights;
      case "natureAndEnvironment":
        return this.sectors_natureAndEnvironment;
      case "religionAndPhilosophy":
        return this.sectors_religionAndPhilosophy;
      case "wellBeing":
        return this.sectors_wellBeing;
    }
  }
}
