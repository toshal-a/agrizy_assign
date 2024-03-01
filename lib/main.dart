import 'package:flutter/material.dart';
import 'package:tapinvest_assign/UI/screens/asset_page.dart';
import 'package:tapinvest_assign/utils/routes.dart';
import 'package:tapinvest_assign/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Map<String, WidgetBuilder> routes;

  @override
  void initState() {
    super.initState();

    routes = getRoutes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      routes: routes
    );
  }
}