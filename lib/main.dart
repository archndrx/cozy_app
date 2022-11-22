import 'package:cozy_app/pages/landing_page.dart';
import 'package:cozy_app/provider/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:cozy_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => SpaceProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
