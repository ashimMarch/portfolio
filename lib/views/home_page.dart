import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/widgets/profile_animation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../contents/my_contents.dart';
import '../contents/my_project_data.dart' show socialMediaList;
import '../globals/app_text_style.dart';
import '../helper_class/helper_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = socialMediaList;

  var socialBI;

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
     
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
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
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyle.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Ashim A',
            style: AppTextStyle.montserratStyle(fontSize: 36),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyle.montserratStyle(color: Colors.white),
              ),
              Text(
              'Flutter Developer',
              style: AppTextStyle.headingStyle(
                fontSize: 24, color: AppColors.robinEdgeBlue),
              )            
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            MyContents.introduction,
            style: AppTextStyle.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        SizedBox(
          height: 48,
          child: ListView.separated(
            itemCount: socialButtons.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, child) => Constants.sizedBox(width: 8.0),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(socialButtons[index].socialMediaLink);
                  log(url.toString());
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
                hoverColor: AppColors.themeColor,
                splashColor: AppColors.lawGreen,
                child: buildSocialButton(
                    index: index,
                    asset: socialButtons[index].socialMediaIcon,
                    hover: socialBI == index ? true : false),
              );
            },
          ),
        ),
        Constants.sizedBox(height: 18.0),
        // FadeInUp(
        //   duration: const Duration(milliseconds: 1800),
        //   child: AppButtons.buildMaterialButton(
        //       onTap: () {}, buttonName: 'Download CV'),
        // ),
      ],
    );
  }

  Ink buildSocialButton({required String asset, required bool hover, required int index}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: FadeInUp(
        duration: const Duration(milliseconds: 1000),
        delay: Duration(milliseconds: 600*index),
        child: Image.asset(
          asset,
          width: 10,
          height: 12,
          color: hover ? AppColors.bgColor : AppColors.themeColor,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
