
import 'package:udemy/Company/company.dart';

class RepoData {
  static final Company bawp = new Company(
      name: 'Suganya M',
      about: 'Flutter Developer with 1.5+ years of experience in designing,'
          ' developing and deploying user-friendly mobile Apps using Dart Language inMobile Application Development.'
          ' Seeking a mid-senior level in flutter developing excellence to excel in a challenging and innovativemobile app developer and strive to exercise my full potential.',
      backdropPhoto: 'assets/background_img.jpg',
    courses: <Course>[
      new Course(
        title: 'Animation',
        thumbnail: 'assets/animation.png',
        url: 'https://www.youtube.com/watch?v=OtrWXLfGtqE&list=PL4cUxeGkcC9gP1qg8yj-Jokef29VRCLt1'
      ),
      new Course(
        title: 'Rest APIs',
        thumbnail: 'assets/rest_api.jpeg',
          url: 'https://www.youtube.com/watch?v=ExPFnu8Dm40&list=PLXbYsh3rUPSzuLcZsIkpDmftSQbFmUq9x'
      ),
      new Course(
          title: 'Dart',
          thumbnail: 'assets/dart.jpg',
          url: 'https://www.youtube.com/watch?v=5rtujDjt50I&list=PLlxmoA0rQ-LyHW9voBdNo4gEEIh0SjG-q'
      ),
      new Course(
        title: 'FireBase',
        thumbnail: 'assets/firebase.png',
        url: 'https://www.youtube.com/watch?v=sfA3NWDBPZ4&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC'
      )
    ],
      location: 'PHONE NO: +91 7845503839', logo: 'assets/photo.jpg',);
}