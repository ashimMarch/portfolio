import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/globals/palette.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../blocs/main_menu_cubit/main_menu_cubit.dart';
import '../contents/my_contents.dart';
import '../globals/app_assets.dart';
import '../globals/app_button.dart';
import '../globals/app_text_style.dart';
import '../helper_class/helper_class.dart';
import '../widgets/rotated_avatar.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key, required this.itemScrollController}) : super(key: key);
final ItemScrollController itemScrollController;
  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(isMobile: true),
          // kHeight10,
          // buildProfilePicture(height: 230),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Palette.bgColor,
    );
  }

  FadeInRight buildProfilePicture({double height = 500}) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Image.asset(
        AppAssets.profile2,
        height: height,
      ),
    );
  }

  // Widget buildProfilePicture() {
  Column buildAboutMeContents({bool isMobile = false}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        kHeight10,
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: GoogleFontStyle.mainTitleText1(),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: GoogleFontStyle.mainTitleText2(),
                )
              ],
            ),
          ),
        ),
        

        isMobile ? Constants.sizedBox(height: 35.0) : kHeight10,
      
        if(isMobile) buildProfilePicture(height: 230),
        kHeight10,
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            MyContents.aboutMe,
            style: AppTextStyle.normalStyle(),
          ),
        ),
        // Constants.sizedBox(height: 15.0),
        // FadeInUp(
        //   duration: const Duration(milliseconds: 1800),
        //   child: AppButtons.buildMaterialButton(
        //       onTap: () {
        //         widget.itemScrollController.scrollTo(
        //         index: 2,
        //         duration: const Duration(seconds: 2),
        //         curve: Curves.fastLinearToSlowEaseIn
        //         ).whenComplete(() => context.read<MainMenuCubit>().onSelectedMenu(2));
        //       }, 
        //       buttonName: 'Read More',
        //   ),
        // )
      ],
    );
  }
}
