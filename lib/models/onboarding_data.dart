class OnBoarding{
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
      subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
      image: 'assets/in_love_bro.svg',
  ),
  OnBoarding(
      title: 'We Provide,\nWhat You Want',
      subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
      image: 'assets/in_love_amico.svg',
  ),
  OnBoarding(
      title: 'Just Happy,\nNo Matter What',
      subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
      image: 'assets/in_love_rafiki.svg',
  ),
];