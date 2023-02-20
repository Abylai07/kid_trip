abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();
  final String profileImage = 'assets/images/bitmap/profile_image.png';
  final String kidTaxi = 'assets/images/bitmap/kid_taxi.png';
  final String profile = 'assets/images/bitmap/profile.png';
  final String my_files = 'assets/images/bitmap/my_files.png';
  final String tournament = 'assets/images/bitmap/tournament.png';
  final String friend = 'assets/images/bitmap/friend.png';
  final String feedback = 'assets/images/bitmap/feedback.png';
}

class _Svg {
  const _Svg();
  final String google = 'assets/images/svg/google.svg';
  final String facebook = 'assets/images/svg/facebook.svg';
  final String redact = 'assets/images/svg/redact.svg';
  final String notif = 'assets/images/svg/notif.svg';

}
