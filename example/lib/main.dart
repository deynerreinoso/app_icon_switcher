import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:app_icon_switcher/app_icon_switcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void _updateIcon() async {
    await AppIconSwitcher.updateIcon('ALT');
  }

  void _resetIcon() async =>
    await AppIconSwitcher.resetIcon();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Icon Switcher'),
        ),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: _updateIcon, child: Text("CHANGE ICON")),
                TextButton(onPressed: _resetIcon, child: Text("RESET ICON")),
              ]
          ),
        ),
      ),
    );
  }
}