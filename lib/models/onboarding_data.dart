class OnBoarding {
  String title;
  String subtitle;
  String image;

  OnBoarding({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Let\'s\nGets Started',
    subtitle:
        'Embark on the journey of a lifetime, where every detail is a reflection of your love story. Our wedding planning app is here to make your dreams come true.',
    image: 'assets/in_love_bro.svg',
  ),
  OnBoarding(
    title: 'We Provide,\nWhat You Want',
    subtitle:
        'Discover a world of possibilities as we tailor our services to your desires. Your vision, our expertise – together, we create the wedding you\'ve always envisioned.',
    image: 'assets/in_love_amico.svg',
  ),
  OnBoarding(
    title: 'Just Happy,\nNo Matter What',
    subtitle:
        'Celebrate love, joy, and each precious moment. With our wedding planning app, your happiness is our priority. No stress, just pure bliss on your special day.',
    image: 'assets/in_love_rafiki.svg',
  ),
];
