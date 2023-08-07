import 'package:flutter/material.dart';
import 'package:nssf_e_wallet/providers/api_client.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:nssf_e_wallet/screens/authentication/login_screen.dart';


Future <void> main() async{

  // Initialize the environment variables
  await loadEnvFile();
  try {
      await fetchData("get-customer-saving-target/centtravy@gmail.com");
  } catch (e) {
    print(e.toString());
  }
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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

