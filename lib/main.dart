
import 'package:flutter/material.dart';
import 'package:my_portfolio/views/main_dashboard_orginal.dart';
import 'package:url_strategy/url_strategy.dart';

// https://ashim-portfolio.web.app/

void main() {//working***
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainDashBoardOrginal(),
    );
  }
}
