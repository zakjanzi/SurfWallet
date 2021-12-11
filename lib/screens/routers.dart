import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surf_wallet/models/wallet.dart';
import 'package:surf_wallet/screens/debug_page.dart';
import 'package:surf_wallet/screens/home/bottom_nav_screen.dart';
import 'package:surf_wallet/screens/onboarding/account_info.dart';
import 'package:surf_wallet/screens/onboarding/choose_langauage_screen.dart';
import 'package:surf_wallet/screens/onboarding/create_password.dart';
import 'package:surf_wallet/screens/onboarding/generate_wallet.dart';
import 'package:surf_wallet/screens/onboarding/onboarding_screen.dart';
import 'package:surf_wallet/screens/onboarding/seed_phrase.dart';
import 'package:surf_wallet/screens/splash/splash_screen.dart';

var onGenerateRoute = (RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => BottomNavScreen());
    case 'debug':
      return MaterialPageRoute(builder: (context) => DebugPage());
    case 'splash': // Start
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case 'choose_language': // Onboarding 1
      return MaterialPageRoute(builder: (context) => ChooseLanguageScreen());
    case 'onboarding_screen': // Onboarding  2
      return MaterialPageRoute(builder: (context) => OnBoardingScreen());
    case 'generate_wallet': // Onboarding  3
      return MaterialPageRoute(builder: (context) => GenerateWalletScreen());
    case 'seed_phrase': // Onboarding  4
      return MaterialPageRoute(builder: (context) => SeedPhrase());
    case 'create_password': // Onboarding  5
      return MaterialPageRoute(
          builder: (context) => CreatePasswordScreen(seedPhrase: settings.arguments as String));
    case 'account_info': // Onboarding  6
      return MaterialPageRoute(
          builder: (context) =>
              AccountInformationScreen(tempWallet: settings.arguments as TempWallet));
    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
};
