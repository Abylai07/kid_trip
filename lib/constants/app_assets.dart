abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();
  final String profileImage = 'assets/images/bitmap/profile_image.png';
  final String kidTaxi = 'assets/images/bitmap/kid_taxi.png';
}

class _Svg {
  const _Svg();
  final String google = 'assets/images/svg/google.svg';
  final String facebook = 'assets/images/svg/facebook.svg';
}
