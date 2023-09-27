import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/views/main_dashboard_orginal.dart';
import 'package:url_strategy/url_strategy.dart';

import 'blocs/main_menu_cubit/main_menu_cubit.dart';

// https://ashim-portfolio.web.app/
// firebase deploy --only hosting:ashim-portfolio
// firebase deploy

Future<void> main() async {
  //working***
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
      home: BlocProvider(
        create: (context) => MainMenuCubit(),
        child: const MainDashBoardOrginal(),
      ),
    );
  }
}
