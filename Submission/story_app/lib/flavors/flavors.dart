enum Flavor {
  free,
  paid,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.free:
        return 'Story App FREE';
      case Flavor.paid:
        return 'Story App';
      default:
        return 'title';
    }
  }
}
