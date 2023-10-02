import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/views/project_card.dart';
import '../contents/my_project_data.dart' show projectList;
import '../globals/palette.dart';
import '../globals/app_text_style.dart';
import '../globals/constants.dart';
import '../helper_class/helper_class.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  final onH0verEffect = Matrix4.identity()..scale(1.0);

  List images = <String>[
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work1,
    AppAssets.work2,
  ];

  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          wrapBuilder(),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          wrapBuilder(),
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          wrapBuilder(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Palette.bgColor,
    );
  }

  Widget wrapBuilder(){
    return Wrap(
      runSpacing: 25,spacing: 25,
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      children: List.generate(
        projectList.length, 
        (index) =>  ProjectDataCard(project: projectList[index])
      ),
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Featured ',
          style: AppTextStyle.headingStyle(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyle.headingStyle(
                  fontSize: 30, color: Palette.mainColor),
            )
          ],
        ),
      ),
    );
  }
}
