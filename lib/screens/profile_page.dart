import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:nssf_e_wallet/screens/authentication/login_screen.dart';
import 'package:nssf_e_wallet/core/shared_preferences.dart';

Future <void> main() async{

  // Initialize the environment variables
  await loadEnvFile();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YeloSave',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home :AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset(
          'assets/images/logo.png',
          width: 10000.0,
          height: 300.0,
          fit: BoxFit.cover,
        ),
        //splash: 'assets/images/logo.png',
        nextScreen : const LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),

    );
  }
}

