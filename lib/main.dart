import 'package:flutter/material.dart';
import 'package:food_app/Screens/home_screen/home_screen.dart';
import 'package:food_app/Screens/home_screen/seachItem/searchItem.dart';
import 'package:food_app/auth/sign_in.dart';
import 'package:food_app/config/config.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: primaryColor,
          ),
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SignIn(),
        });
  }
}
