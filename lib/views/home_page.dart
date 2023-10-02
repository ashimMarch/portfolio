import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/palette.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/widgets/profile_animation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../contents/my_contents.dart';
import '../contents/my_project_data.dart' show socialMediaList;
import '../globals/app_button.dart';
import '../globals/app_text_style.dart';
import '../helper_class/helper_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _socialMedia = socialMediaList;

  int? socialBI;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation()
        ],
      ),
      
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
     
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeIn(
          duration: const Duration(milliseconds: 1000),
          child: Text(
            'Hello, It\'s Me',
            style: GoogleFontStyle.whiteHeading()
          ),
        ),
        kHeight5,
        FadeIn(
          duration: const Duration(milliseconds: 1500),
          delay: const Duration(milliseconds: 800),
          child: Text(
            'Ashim A',
            style: AppTextStyle.montserratStyle(
              fontSize: 36,
              color: Palette.mainColor
            ),
          ),
        ),
        kHeight5,
        FadeIn(
          duration: const Duration(milliseconds: 1500),
          delay: const Duration(milliseconds: 1300),
          child: Row(
            children: [
              Text(
                'and I\'m a ',
                style: GoogleFontStyle.whiteHeading()
              ),
              Text(
              'Flutter Developer',
              style: AppTextStyle.headingStyle(
                fontSize: 24, 
                color: Palette.mainColor
                ),
              )            
            ],
          ),
        ),
        Constants.sizedBox(height: 11.0),
        FadeIn(
          duration: const Duration(milliseconds: 1500),
          delay: const Duration(milliseconds: 2000),
          child: Text(
            MyContents.introduction,
            style: AppTextStyle.normalStyle(),//fontSize: 13.5  
          ),
        ),
        Constants.sizedBox(height: 22.0),
        SizedBox(
          height: 48,
          child: ListView.separated(
            itemCount: _socialMedia.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, child) => Constants.sizedBox(width: 8.0),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(_socialMedia[index].socialMediaLink);
                  await launchUrl(url);
                },
                onHover: (value) {
                  setState(() {
                    if (value) {
                      socialBI = index;
                    } else {
                      socialBI = null;
                    }
                  });
                },
                borderRadius: BorderRadius.circular(550.0),
                hoverColor: Palette.mainColor,
                splashColor: Palette.whiteColor,
                child: buildSocialButton(
                    index: index,
                    asset: _socialMedia[index].socialMediaIcon,
                    hover: socialBI == index ? true : false),
              );
            },
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeIn(
          duration: const Duration(milliseconds: 1500),
          delay: const Duration(milliseconds: 2700),
          child: AppButtons.buildMaterialButton(
              onTap: () async {
                final Uri url = Uri.parse('https://firebasestorage.googleapis.com/v0/b/my-portfolio-ed780.appspot.com/o/portfolio%2FAshim_flutter_developer.pdf?alt=media&token=80fff918-5c31-4538-adbc-b84139ad7435');
                await launchUrl(url);
              }, 
              buttonName: 'Download CV'),
        ),
      ],
    );
  }

  Widget buildSocialButton({required String asset, required bool hover, required int index}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Palette.mainColor, width: 2.0),
        color: Palette.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Center(
        child: FadeInUp(
          duration: const Duration(milliseconds: 1000),
          delay: Duration(milliseconds: 2500+(200*index)),
          child: Image.asset(
            asset,
            width: 25,
            height: 25,
            color: hover ? Palette.bgColor : Palette.mainColor,
            // fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
