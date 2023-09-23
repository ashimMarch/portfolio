
import 'package:flutter/material.dart';
import 'package:my_portfolio/views/about_me.dart';
import 'package:my_portfolio/views/home_page.dart';
import 'package:my_portfolio/views/my_projects.dart';
import 'package:my_portfolio/views/my_services.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_style.dart';
import '../globals/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainDashBoardOrginal extends StatefulWidget {
  const MainDashBoardOrginal({Key? key}) : super(key: key);

  @override
  State<MainDashBoardOrginal> createState() => _MainDashBoardOrginalState();
}

class _MainDashBoardOrginalState extends State<MainDashBoardOrginal> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ScrollOffsetController _scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'Home',
    'About',
    'Services',
    'Portfolio',
    // 'Contact',
  ];

  var menuIndex = 0;

  List<Widget> screensList = [];
  
  @override
  void initState() {
    super.initState();
    screensList = const <Widget>[
      HomePage(),
      AboutMe(),
      MyServices(),
      MyProjects(),
    ];
  }

  Future scrollTo({required int index}) async {
    _itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn)
        .whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 90,
        titleSpacing: 40,
        elevation: 0,
        title: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 768) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Portfolio'),
                      const Spacer(),
                      PopupMenuButton(
                        icon: Icon(
                          Icons.menu_sharp,
                          size: 32,
                          color: AppColors.white,
                        ),
                        color: AppColors.bgColor2,
                        position: PopupMenuPosition.under,
                        constraints: BoxConstraints.tightFor(width: size.width * 0.9),
                        itemBuilder: (BuildContext context) => menuItems
                            .asMap()
                            .entries
                            .map(
                              (e) => PopupMenuItem(
                                textStyle: AppTextStyle.headerTextStyle(),
                                onTap: () {
                                  scrollTo(index: e.key);
                                },
                                child: Text(e.value),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Portfolio'),
                      const Spacer(),
                      SizedBox(
                        height: 30,
                        child: ListView.separated(
                          itemCount: menuItems.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, child) =>
                              Constants.sizedBox(width: 8),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                scrollTo(index: index);
                              },
                              borderRadius: BorderRadius.circular(100),
                              onHover: (value) {
                                setState(() {
                                  if (value) {
                                    menuIndex = index;
                                  } else {
                                    menuIndex = 0;
                                  }
                                });
                              },
                              child: buildNavBarAnimatedContainer(
                                  index, menuIndex == index ? true : false),
                            );
                          },
                        ),
                      ),
                      Constants.sizedBox(width: 30),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: screensList.length,
        itemBuilder: (context, index) => screensList[index],
        itemScrollController: _itemScrollController,
        itemPositionsListener: _itemPositionsListener,
        scrollOffsetController: _scrollOffsetController,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      transform: hover ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: AppTextStyle.headerTextStyle(
            color: hover ? AppColors.themeColor : AppColors.white),
      ),
    );
  }
}
