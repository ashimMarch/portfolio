
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/contents/my_project_data.dart' show ProjectModel;
import 'package:my_portfolio/globals/palette.dart';
import 'package:url_launcher/url_launcher.dart';

import '../globals/app_assets.dart';
import '../globals/app_text_style.dart';

class ProjectDataCard extends StatefulWidget {
  const ProjectDataCard({super.key, required this.project});
  final ProjectModel project;

  @override
  State<ProjectDataCard> createState() => _ProjectDataCardState();
}

class _ProjectDataCardState extends State<ProjectDataCard> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  late ValueNotifier<bool> animateText;
  late ProjectModel project;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _animation = Tween(
      begin: 1.0,
      end: 0.0
    ).animate(_controller);
    animateText = ValueNotifier(false);
    project = widget.project;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        
      },
      onHover: (value) {
        if (value) {
            _controller.forward();
            animateText.value = value;
        } else {
            _controller.reverse();
            animateText.value = value;
        }
      },
      child: Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(CardBackground.cardBg),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(blurRadius: 15,spreadRadius: 5,color: Palette.bgColor,offset: Offset(0,10))
          ],
          borderRadius: BorderRadius.circular(15)
        ),
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: animateText,
                builder:(context, value, _) => FadeOut(
                  animate: value,
                  duration: const Duration(milliseconds: 900),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      project.projectIcon,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, _) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                    top: -300*_animation.value,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Palette.mainColor.withOpacity(0.9),
                            Palette.mainColor.withOpacity(0.1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                        )
                      ),
                      width: 400,
                      height: 300,
                    ),
                  );
                }
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ValueListenableBuilder(
                  valueListenable: animateText,
                  builder: (context, value, _) {
                    return FadeInUp(
                      animate: value,
                      duration: const Duration(milliseconds: 900),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '${project.projectName}\n',
                              style: AppTextStyle.headingStyle(fontSize: 22.0),
                              children: [
                                TextSpan(
                                  text: project.projectDetiles,
                                  style: AppTextStyle.normalStyle(fontSize: 12.0)
                                )
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: () async {
                              final Uri url = Uri.parse(project.playStoreLink);
                              await launchUrl(url);
                            },
                            child: const CircleAvatar(
                              maxRadius: 20,
                              backgroundColor: Palette.whiteColor,
                              child: Icon(Icons.ios_share_outlined,color: Palette.mainColor,)
                            ),
                          )
                        ],
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    animateText.dispose();
    super.dispose();
  }
}


class ProjectDataCardMobile extends StatefulWidget {
  const ProjectDataCardMobile({super.key, required this.project});
  final ProjectModel project;

  @override
  State<ProjectDataCardMobile> createState() => _ProjectDataCardMobileState();
}

class _ProjectDataCardMobileState extends State<ProjectDataCardMobile> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  late ValueNotifier<bool> animateText;
  late ProjectModel project;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _animation = Tween(
      begin: 1.0,
      end: 0.0
    ).animate(_controller);
    animateText = ValueNotifier(false);
    project = widget.project;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _controller.forward();
        animateText.value = true;
      },
      child: Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(CardBackground.cardBg),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(blurRadius: 15,spreadRadius: 5,color: Palette.bgColor,offset: Offset(0,10))
          ],
          borderRadius: BorderRadius.circular(15)
        ),
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: animateText,
                builder:(context, value, _) => FadeOut(
                  animate: value,
                  duration: const Duration(milliseconds: 900),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      project.projectIcon,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              
              AnimatedBuilder(
                animation: _animation,
                builder: (context, _) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                    top: -300*_animation.value,
                    child: InkWell(
                      onTap: () {
                        _controller.reverse();
                        animateText.value = false;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Palette.mainColor,
                              Palette.mainColor.withOpacity(0.4),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                          )
                        ),
                        width: 400,
                        height: 300,
                      ),
                    ),
                  );
                }
              ),
              
              Padding(
                padding: const EdgeInsets.all(10),
                child: ValueListenableBuilder(
                  valueListenable: animateText,
                  builder: (context, value, _) {
                    return FadeInUp(
                      animate: value,
                      duration: const Duration(milliseconds: 900),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '${project.projectName}\n',
                              style: AppTextStyle.headingStyle(fontSize: 22.0),
                              children: [
                                TextSpan(
                                  text: project.projectDetiles,
                                  style: AppTextStyle.normalStyle(fontSize: 12.0)
                                )
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: () async {
                              final Uri url = Uri.parse(project.playStoreLink);
                              await launchUrl(url);
                            },
                            child: const CircleAvatar(
                              maxRadius: 20,
                              backgroundColor: Palette.whiteColor,
                              child: Icon(Icons.ios_share_outlined,color: Palette.mainColor,)
                            ),
                          )
                        ],
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    animateText.dispose();
    super.dispose();
  }
}