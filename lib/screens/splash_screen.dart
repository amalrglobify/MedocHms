import 'dart:async'; // Import for Timer
import 'package:auto_route/annotations.dart';
import 'package:demoforfiles/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3100), () {
      context.router.replace(const DashboardRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF37EB58),
      body: SafeArea(
        child: Center(
          child: Icon(Icons.add_a_photo),
        )
      ),
    );
  }
}
