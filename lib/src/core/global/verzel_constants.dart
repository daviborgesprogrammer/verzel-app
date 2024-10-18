sealed class VerzelConstants {
  static Images images = Images();
}

final class Images {
  String logo = 'assets/images/logo_color.png';
  String profile = 'assets/images/profile.png';
}

enum SessionStorageKeys {
  accessToken('/ACCESS_TOKEN/');

  final String key;

  const SessionStorageKeys(this.key);
}
