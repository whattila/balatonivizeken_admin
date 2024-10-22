enum BoatType {
  waterSportsEquipment,
  smallBoat,
  licensedBoat,
}

extension BoatTypeExtension on BoatType {
  static BoatType fromString(String value) {
    switch (value) {
      case 'waterSportsEquipment':
        return BoatType.waterSportsEquipment;
      case 'smallBoat':
        return BoatType.smallBoat;
      case 'licensedBoat':
        return BoatType.licensedBoat;
      default:
        throw ArgumentError('Unknown boat type: $value');
    }
  }

  String get displayName {
    switch (this) {
      case BoatType.waterSportsEquipment:
        return "Vízi sporteszköz";
      case BoatType.smallBoat:
        return "Kisméretű hajó";
      case BoatType.licensedBoat:
        return "Regisztrált hajó";
      default:
        return "Nem létező hajótípus";
    }
  }
}
