import 'package:flutter/material.dart';
import 'modules/barcode_scanner/barcode_scanner_page.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/themes/appcolors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pay Flow',
        theme: ThemeData(
            primarySwatch: Colors.orange, primaryColor: AppColors.primary),
        initialRoute: '/splach',
        routes: {
          '/splach': (context) => SplashPage(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/barcode_scanner': (context) => BarcodeScannerPage(),
        });
  }
}
