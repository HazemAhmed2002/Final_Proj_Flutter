class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Hazem A. Lubbad",
    image: "images/hazem.jpg",
    desc: "120202481",
  ),
  OnboardingContents(
    title: "Hesham H. Rajab",
    image: "images/hazem.jpg",
    desc: "120202172",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "images/check-list.png",
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
