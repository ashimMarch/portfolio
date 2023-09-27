import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/contents/my_contents.dart' show myServicesMap, ServiceType;
import 'package:my_portfolio/globals/palette.dart';
import 'package:my_portfolio/globals/constants.dart';

import '../globals/app_text_style.dart';
import '../helper_class/helper_class.dart';


class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  late ValueNotifier<ServiceType?> _onTapNotifier;
  bool isApp = false, iOS = false, web = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

@override
void initState() {
  super.initState();
  _onTapNotifier = ValueNotifier(null);
}
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: ValueListenableBuilder(
        valueListenable: _onTapNotifier,
        builder: (context, selectedService, _) {
          return Column(
            children: [
              buildMyServicesText(),
              Constants.sizedBox(height: 60.0),
              InkWell(
                onTap: () {
                  isApp = true;
                  iOS = web = false;
                  _onTapNotifier.value = ServiceType.android;
                },
                child: buildAnimatedContainer(
                  asset: myServicesMap[ServiceType.android]!.icon,
                  title: myServicesMap[ServiceType.android]!.title,
                  body: myServicesMap[ServiceType.android]!.content,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(height: 24.0),
              InkWell(
                onTap: () {
                  iOS = true;
                  isApp = web = false;
                  _onTapNotifier.value = ServiceType.iOS;
                },
                child: buildAnimatedContainer(
                  asset: myServicesMap[ServiceType.iOS]!.icon,
                  title: myServicesMap[ServiceType.iOS]!.title,
                  body: myServicesMap[ServiceType.iOS]!.content,
                  hover: iOS,
                ),
              ),
              Constants.sizedBox(height: 24.0),
              InkWell(
                onTap: () {
                  web = true;
                  isApp = iOS = false;
                  _onTapNotifier.value = ServiceType.web;
                },
                child: buildAnimatedContainer(
                  asset: myServicesMap[ServiceType.web]!.icon,
                  title: myServicesMap[ServiceType.web]!.title,
                  body: myServicesMap[ServiceType.web]!.content,
                  hover: web,
                ),
              )
            ],
          );
        }
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  asset: myServicesMap[ServiceType.android]!.icon,
                  title: myServicesMap[ServiceType.android]!.title,
                  body: myServicesMap[ServiceType.android]!.content,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    iOS = value;
                  });
                },
                child: buildAnimatedContainer(
                  asset: myServicesMap[ServiceType.iOS]!.icon,
                  title: myServicesMap[ServiceType.iOS]!.title,
                  body: myServicesMap[ServiceType.iOS]!.content,
                  hover: iOS,
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 26.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                web = value;
              });
            },
            child: buildAnimatedContainer(
              asset: myServicesMap[ServiceType.web]!.icon,
              title: myServicesMap[ServiceType.web]!.title,
              body: myServicesMap[ServiceType.web]!.content,
              hover: web,
              width: 725.0,
              hoverWidth: 735.0,
            ),
          )
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  asset: myServicesMap[ServiceType.android]!.icon,
                  title: myServicesMap[ServiceType.android]!.title,
                  body: myServicesMap[ServiceType.android]!.content,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    iOS = value;
                  });
                },
                child: buildAnimatedContainer(
                  asset: myServicesMap[ServiceType.iOS]!.icon,
                  title: myServicesMap[ServiceType.iOS]!.title,
                  body: myServicesMap[ServiceType.iOS]!.content,
                  hover: iOS,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    web = value;
                  });
                },
                child: buildAnimatedContainer(
                  asset: myServicesMap[ServiceType.web]!.icon,
                  title: myServicesMap[ServiceType.web]!.title,
                  body: myServicesMap[ServiceType.web]!.content,
                  hover: web,
                ),
              )
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.04,
      bgColor: Palette.bgColor,
    );
  }

  FadeInDown buildMyServicesText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyle.headingStyle(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Services',
              style: AppTextStyle.headingStyle(
                  fontSize: 30.0, color: Palette.mainColor),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String body,
    required String asset,
    required bool hover,
    double width = 350,
    double hoverWidth = 360,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 390 : 380,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: Palette.bgColor,
        borderRadius: BorderRadius.circular(30),
        border: hover ? Border.all(color: Palette.mainColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 5.0,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 50,
            height: 50,
            color: Palette.mainColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyle.montserratStyle(
                color: Colors.white, fontSize: 22.0),
          ),
          Constants.sizedBox(height: 12.0),
          Text(
            body,
            style: AppTextStyle.normalStyle(fontSize: 12.0),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 20.0),
          // AppButtons.buildMaterialButton(buttonName: 'Read More', onTap: () {})
        ],
      ),
    );
  }

  @override
  void dispose() {
    _onTapNotifier.dispose();
    super.dispose();
  }
}
