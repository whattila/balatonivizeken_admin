enum StormDegree {
  basic,
  first,
  second
}

extension StormDegreeInText on StormDegree {
  String get displayName {
    switch (this) {
      case StormDegree.basic:
        return "Alapfokú vihar";
      case StormDegree.first:
        return "Elsőfokú vihar";
      case StormDegree.second:
        return "Másodfokú vihar";
      default:
        return "Vihar!";
    }
  }
}