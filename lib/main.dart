import 'package:flutter/material.dart';
import 'package:smart_factory/pages/admin/account.dart';
import 'package:smart_factory/pages/admin/data.dart';
import 'package:smart_factory/pages/admin/home.dart';
import 'package:smart_factory/pages/login.dart';
import 'package:smart_factory/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          Routes.login: (context) => const Login(),
          Routes.home: (context) => const Home(),
          Routes.data: (context) => const Data(),
          Routes.account: (context) => const Account(),
        });
  }
}
