enum UserType {
  normal,
  lifeguard,
  admin
}

extension UserTypeExtension on UserType {
  static UserType fromString(String value) {
    switch (value) {
      case 'admin':
        return UserType.admin;
      case 'lifeguard':
        return UserType.lifeguard;
      case 'normal':
        return UserType.normal;
      default:
        throw ArgumentError('Unknown user type: $value');
    }
  }

  String get displayName {
    switch (this) {
      case UserType.normal:
        return "Hajós";
      case UserType.lifeguard:
        return "Vízimentő";
      case UserType.admin:
        return "Adminisztrátor";
      default:
        return "Nem létező hajótípus";
    }
  }
}