import 'dart:async'; // Import for Timer
import 'package:auto_route/annotations.dart';
import 'package:medochms/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';

import '../rest/hive_repo.dart';

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
    HiveRepo.instance.setBaseUrl(baseUrl: "http://49.50.79.12:74/");
    Timer(const Duration(seconds: 2), () {
      if(HiveRepo.instance.user == null){
        context.router.replace(SignInRoute(departmentValue: "", departmentId: ""));
      }else{
        context.router.replace(const DashboardRoute());
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF37EB58),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset("assets/images/medochmslogo.png"),
            ),
            Gap(50),
            CircularProgressIndicator(color: Colors.black,)
          ],
        )
      ),
    );
  }
}
