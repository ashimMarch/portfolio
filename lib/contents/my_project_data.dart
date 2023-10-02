
import '../globals/app_assets.dart';

class ProjectModel{
  final String projectName;
  final String projectDetiles;
  final String projectIcon;
  final String playStoreLink;
  const ProjectModel({
    required this.projectName,
    required this.projectDetiles,
    required this.projectIcon,
    required this.playStoreLink,
  });
}

final projectList = [
  ProjectModel(
    projectName: 'Maarch', 
    projectDetiles: 'Maarch is a sleek and efficient retail billing app, perfect for businesses looking to simplify their sales transactions,', 
    projectIcon: MyProjectImage.maarch,
    playStoreLink: 'https://play.google.com/store/apps/details?id=com.march.march&hl=en-IN'
  ),
  ProjectModel(
    projectName: 'nic', 
    projectDetiles: 'One-stop platform for buying and selling a wide range of items and services. Whether you\'re in the market for realestate, vehicles, or more, this application offers a comprehensive solution for your buying and selling needs.', 
    projectIcon: MyProjectImage.nic,
    playStoreLink: ''
  ),
  ProjectModel(
    projectName: 'Cloi-Ecommerce', 
    projectDetiles: 'Our E-Commerce app builder offers a range of customisable templates, features, and integrations to help you design an app that meets your business needs.', 
    projectIcon: MyProjectImage.cloi,
    playStoreLink: 'https://play.google.com/store/search?q=cloi&c=apps&hl=en-IN'
  ),
  ProjectModel(
    projectName: 'Evencross', 
    projectDetiles: 'MLM application with data privacy awareness. Developer shares data practices, subject to updates.', 
    projectIcon: MyProjectImage.evencross,
    playStoreLink: 'https://play.google.com/store/apps/details?id=com.evencross.evencross&hl=en-IN'
  ),
];

class SocialMediaModel{
  final String socialMediaIcon;
  final String socialMediaLink;
  const SocialMediaModel({
    required this.socialMediaIcon,
    required this.socialMediaLink,
  });
}

final socialMediaList = [
  SocialMediaModel(
    socialMediaIcon: SocialMediaAssets.linkedIn, 
    socialMediaLink: 'https://www.linkedin.com/in/ashim-a-9b273824a'
  ),
  SocialMediaModel(
    socialMediaIcon: SocialMediaAssets.github, 
    socialMediaLink: 'https://github.com/ashimMarch'
  ),
  SocialMediaModel(
    socialMediaIcon: SocialMediaAssets.whatsapp, 
    socialMediaLink: 'https://wa.me/+917560951397/?text=Hi, I am contacting from your portfolio.'
  ),
  SocialMediaModel(
    socialMediaIcon: SocialMediaAssets.email, 
    socialMediaLink: 'mailto:ashim8696@gmail.com'
  ),
];