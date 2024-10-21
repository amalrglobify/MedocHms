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
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        height:   MediaQuery.of(context).size.height * 1,
        width:   MediaQuery.of(context).size.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
              child: Image.asset("assets/images/medocsplashlogo.png", width: MediaQuery.of(context).size.width * 0.5,),
            ),
            Image.asset("assets/images/doctorlogo.png",
                width: MediaQuery.of(context).size.width * 0.98,
                height: MediaQuery.of(context).size.height * 0.6,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
