import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/wallpaper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
        ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Wallpaper()
        )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: FlutterLogo(
          size: 30,
        ),
      ),

    );
  }
}
