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

extension TagName on S {
  getTagName(String tagname) {
    switch(tagname) {
      case "Certification mark":
        return this.tag_certificationMark;
      case "Tax relief":
        return this.tag_taxRelief;
      case "National":
        return this.tag_national;
      case "Religious identity":
        return this.tag_religiousIdentity;
      case "International":
        return this.tag_international;
      case "Scale":
        return this.tag_scale;
      case "Directness":
        return this.tag_directness;
      case "Financial adoption":
        return this.tag_financialAdoption;
      case "Animals":
        return this.tag_animals;
      case "Health":
        return this.tag_health;
      case "International aid and human rights":
        return this.tag_internationalAidAndHumanRights;
      case "Art and culture":
        return this.tag_artAndCulture;
      case "Nature and environment":
        return this.tag_natureAndEnvironment;
      case "Education and science":
        return this.tag_educationAndScience;
      case "Religion and philosophy":
        return this.tag_religionAndPhilosophy;
      case "Well-being":
        return this.tag_wellBeing;
      case "Reach":
        return this.tag_reach;
      case "Investing":
        return this.tag_investing;
    }
  }
}
