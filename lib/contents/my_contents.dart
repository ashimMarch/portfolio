import '../globals/app_assets.dart';


final Map<ServiceType, MyServiceData> myServicesMap = {
                  ServiceType.android: MyServiceData(
                                    icon: AppAssets.logoAndroid, 
                                    title: 'Android Development', 
                                    content: MyContents.android, 
                                    type: ServiceType.android,
                                  ),
                  ServiceType.iOS: MyServiceData(
                                    icon: AppAssets.logoiOS, 
                                    title: 'iOS Development', 
                                    content: MyContents.iOS, 
                                    type: ServiceType.iOS,
                                  ),
                  ServiceType.web: MyServiceData(
                                    icon: AppAssets.logoWeb, 
                                    title: 'Web Development', 
                                    content: MyContents.web, 
                                    type: ServiceType.web,
                                  ),
                };

class MyServiceData {
  final String icon;
  final String title;
  final String content;
  final ServiceType type;

  const MyServiceData({
    required this.icon,
    required this.title,
    required this.content,
    required this.type,
  });
}

enum ServiceType { android, iOS, web}

class MyContents{
  static const introduction = 'Welcome to my digital atelier, elegance meets code to orchestrate captivating visual experiences. In this Flutter-powered world, innovation meets pixel-perfect design, resulting in immersive user experiences that captivate and inspire. I invite you to embark on a journey through my portfolio, where the magic of Flutter transforms ideas into vibrant, interactive realities. Explore the wonders crafted in this space, and let\'s bring your next digital vision to life.';

  static const aboutMe = 'I\'m a dedicated Flutter developer with two years of hands-on experience in crafting beautiful and functional mobile applications. My passion for creating user-friendly and visually stunning mobile apps and website drives me to stay at the forefront of Flutter\'s evolving ecosystem.';

  static const android = 'Android development with Flutter allows me to create seamless and engaging mobile experiences for the world\'s most popular mobile platform. From crafting user-friendly UIs to optimizing performance, I specialize in building Android apps that stand out';
  
  static const iOS = 'Venturing into iOS development with Flutter, I\'m eager to explore and innovate in the world of Apple\'s mobile platform. While my experience may be evolving, I\'m committed to crafting iOS apps that embrace Flutter\'s potential and provide users with engaging experiences.';
  
  static const web = 'Web development with Flutter empowers me to craft dynamic and immersive online experiences. By leveraging Flutter\'s versatility, I aim to push the boundaries of web development and deliver standout online solutions.';
}
