import 'package:AG/screens/desktop_screens/home_browser_screen.dart';
import 'package:AG/screens/desktop_screens/new_browser_screen.dart';
import 'package:AG/screens/mobile_screens/home_mobile_screen.dart';
import 'package:AG/screens/mobile_screens/new_mobile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:AG/screens/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeMobileScreenState();
}

class _HomeMobileScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform ==  TargetPlatform.android) ?
      const HomeMobileScreen() : const HomeBrowserScreen();
  }
}
