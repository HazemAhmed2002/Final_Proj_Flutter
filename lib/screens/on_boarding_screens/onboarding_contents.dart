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
    title: "Stay organized with team",
    image: "images/check-list.png",
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "images/check-list.png",
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
