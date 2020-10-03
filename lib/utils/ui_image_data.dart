class UIImageData {

  // Image directory
  static const String imageDir = 'assets/images';

  static const String child = '$imageDir/child.jpg';
  static const String man = '$imageDir/man.jpg';
  static const String man1 = '$imageDir/man1.jpg';
  static const String model = '$imageDir/model.jpg';
  static const String model1 = '$imageDir/model1.jpg';
  static const String model2 = '$imageDir/model2.jpg';
  static const String model3 = '$imageDir/model3.jpg';
  static const String model4 = '$imageDir/model4.jpg';
  static const String model5 = '$imageDir/model5.jpg';

  static const String osin = '$imageDir/b.jpeg';
  static const String buratai = '$imageDir/news1.jpg';

  // DIFFERENT POST. Single post can contain list of images/videos
  static const List<String> post1 = [model2];
  static const List<String> post2 = [man];
  static const List<String> post3 = [man1];
  static const List<String> post4 = [model4];
  static const List<String> post5 = [model1];
  static const List<String> post6 = [child];

  static const List<String> news1 = [osin];
  static const List<String> news2 = [buratai];

  // TOTAL POST. Total posts should be list
  static List<List<String>> postList = [
    post1,
    post2,
    post3,
    post4,
    post5,
    post6,
  ];

  static List<List<String>> newsList = [
    news1,
    news2,
  ];
}
