import 'package:flutter/material.dart';
import 'package:qyre_test/core/theming/themes.dart';
import 'package:qyre_test/features/main/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qyre Test App',
      theme: themes,
      home: const MainPage(),
    );
  }
}
