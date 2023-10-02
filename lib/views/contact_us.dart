import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../contents/contact_info.dart';
import '../contents/my_project_data.dart';
import '../globals/app_text_style.dart';
import '../globals/constants.dart';
import '../globals/palette.dart';


class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _socialMedia = socialMediaList;
  final _contactList = contactList;
  int? _socialBI;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // kHeight100,
        const SizedBox(height: 50,),
        RichText(
            text: TextSpan(
              text: 'Contact ',
              style: GoogleFontStyle.mainTitleText1(),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: GoogleFontStyle.mainTitleText2(),
                )
              ],
            ),
          ),
          Text(
            'If you have any questions please feel free to contact me',
            style: GoogleFontStyle.mainSubTitle(),
          ),
        // kHeight25,
        const SizedBox(height: 25,),
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            //  height: height * .3,
            //  width: width * .7,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Palette.mainColor, Palette.mainColor.withOpacity(.3)]),
                border: Border.all(
                  width: 2,
                  color: Colors.white30,
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  // spacing: 40.0,
                  // runSpacing: 30.0,
                  children: List.generate(_contactList.length, (index) => ContactAddress(
                      title: _contactList[index].title, 
                      contact: _contactList[index].contact, 
                      icon: _contactList[index].icon,
                    )
                  )
                ),
                // kHeight25,
                const SizedBox(height: 25,),
                
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
                              _socialBI = index;
                            } else {
                              _socialBI = null;
                            }
                          });
                        },
                        borderRadius: BorderRadius.circular(550.0),
                        hoverColor: Palette.mainColor,
                        splashColor: Palette.whiteColor,
                        child: buildSocialButton(
                            index: index,
                            asset: _socialMedia[index].socialMediaIcon,
                            hover: _socialBI == index ? true : false),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 100,),
        Container(
          height: 50,
          width: double.infinity,
          color: Palette.mainColor,
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
        child: Image.asset(
          asset,
          width: 25,
          height: 25,
          color: hover ? Palette.bgColor : Palette.mainColor,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}


class ContactAddress extends StatelessWidget {
  final String title;
  final String contact;
  final IconData icon;

  const ContactAddress({
    super.key,
    required this.title,
    required this.contact,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Palette.whiteColor.withOpacity(.8),
              ),
              const SizedBox(width: 5,),
              Text(
                title,
                style: GoogleFontStyle.mainSubTitle()
              )
            ],
          ),
          Text(
            contact,
            style: GoogleFontStyle.mainSubTitle(
              fontSize: 15,
              color: Colors.black
            ),
          )
        ],
      ),
    );
  }
}
