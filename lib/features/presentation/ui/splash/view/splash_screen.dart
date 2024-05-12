import 'dart:core';
import 'dart:async';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  SplashScreen();

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

// Create a widget state
class _SplashScreenState extends State<SplashScreen> {
  void redirect(){
    Future.delayed(
      const Duration(seconds: 3),
      () {
        AutoRouter.of(context).pushPathState(const HomeRoute());
      },
    );
  }

  // State initialization
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    
    redirect();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    // redirect();
    // And this is the layout of the widget,
    // a bit like QML although obviously not a JSON structure
    const AssetImage logo = AssetImage('assets/images/image_3.jpg');
    return Scaffold(
      body: Container(
        width: double.infinity,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //       colors: [Colors.blue, Colors.purple],
        //       begin: Alignment.topRight,
        //       end: Alignment.bottomLeft),
        // ),
        child: Animate(
          effects: const [
            FadeEffect(delay: Duration(milliseconds: 0)),
          ],
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60, // Image radius
                backgroundImage: logo,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Example",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 32),
              )
            ],
          ),
        ),
      ),
    );
  }
}
