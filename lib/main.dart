import 'package:flutter/material.dart';
import 'package:nike_store/data/product.dart';
import 'package:nike_store/data/repo/banner_repository.dart';
import 'package:nike_store/data/repo/product_repository.dart';
import 'package:nike_store/theme.dart';
import 'package:nike_store/ui/auth/auth.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    productrepository.getAll(ProductSort.latest).then((value) {
      debugPrint(value.toString());
    }).catchError((e) {
      debugPrint(e.toString());
    });
    bannerRepository.getAll().then((value) {
      debugPrint(value.toString());
    }).catchError((e){
      debugPrint(e.toString());
    });
    const defaultTextStyle = TextStyle(
        fontFamily: 'BNaznnBd', color: LightThemeColor.primaryTextColor);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          subtitle1: defaultTextStyle.apply(color: LightThemeColor.secondaryTextColor),
            bodyText2: defaultTextStyle,
            button: defaultTextStyle,
            caption: defaultTextStyle.apply(
                color: LightThemeColor.secondaryTextColor),
            headline6: defaultTextStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 18)),
        colorScheme: const ColorScheme.light(
          primary: LightThemeColor.primaryColor,
          secondary: LightThemeColor.secondaryColor,
          onSecondary: Colors.white,
        ),
      ),
      home: const Directionality(
          textDirection: TextDirection.rtl,
          child: AuthScreen()),
    );
  }
}

