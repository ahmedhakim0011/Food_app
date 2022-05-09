import 'package:flutter/material.dart';
import 'package:food_app/Screens/home_screen/home_screen.dart';

import 'package:food_app/config/config.dart';
import 'package:food_app/providers/productProvider/productProvider.dart';
import 'package:food_app/widgets/themes.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: GetMaterialApp(
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
          }),
    );
  }
}
