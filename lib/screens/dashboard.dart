

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medochms/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../theme/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/pi_chart.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Sun', 12),
      _ChartData('Mon', 15),
      _ChartData('Tue', 30),
      _ChartData('Wed', 60),
      _ChartData('Thu', 10),
      _ChartData('Fri', 80),
      _ChartData('Sat', 55)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  List<Sector> sectors = [
    Sector(color: Color(0XFF3C001F), value: 60, name: "Dr. Ramchand S"),
    Sector(color: Color(0XFFF5007F), value: 20, name: "Dr. Abhilash N"),
    Sector(color: Color(0XFF333E9F), value: 30, name: "Dr. Manu Das M"),
    Sector(color: Color(0XFF77209F), value: 50, name: "Dr. Varun Prabhakar"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackgroundColor,
      appBar: CustomAppBar(
        title: Image.asset("assets/images/medochmslogo.png"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundColor: Color(0XFFF3007E),
                child: Text("A", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),)
            ),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 5,
                    child: GestureDetector(
                      onTap: (){
                        context.pushRoute(NewIpListingRoute());
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0XFF3C001F), Color(0XFFF5007F)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.circular(12), // Optional border radius
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("35", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                Text("New IP", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
                              ],
                            ),
                            Image.asset("assets/images/notificationimage.png", height: 35, color: Colors.white,fit: BoxFit.contain,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Flexible(
                    flex: 5,
                    child: GestureDetector(
                      onTap: (){
                        context.pushRoute(RevisitListingRoute());
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0XFF333E9F), Color(0XFF77209F)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight, // Define the gradient end
                          ),
                          borderRadius: BorderRadius.circular(12), // Optional border radius
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("20", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                Text("Revist", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
                              ],
                            ),
                            Image.asset("assets/images/revisitlogo.png", height: 40, color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 5,
                    child: GestureDetector(
                      onTap: (){
                        context.pushRoute(RegistrationListRoute());
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0XFF040205), Color(0XFF4E3167)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight, // Define the gradient end
                          ),
                          borderRadius: BorderRadius.circular(12), // Optional border radius
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("35", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                Text("Registrations", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
                              ],
                            ),
                            Image.asset("assets/images/registrationlogo.png", height: 35, color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Flexible(
                    flex: 5,
                    child: GestureDetector(
                      onTap: (){
                        context.pushRoute(TotalAdmitListingRoute());
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0XFFD72628), Color(0XFF505296)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight, // Define the gradient end
                          ),
                          borderRadius: BorderRadius.circular(12), // Optional border radius
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("20", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                Text("Total Admit", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
                              ],
                            ),
                            Image.asset("assets/images/admittedicon.png", height: 40, color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("Revist Graph", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.3)),
              SizedBox(height: 10,),
              Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 20),
                    tooltipBehavior: _tooltip,
                    series: <CartesianSeries<_ChartData, String>>[
                      ColumnSeries<_ChartData, String>(
                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          name: 'patients',
                          color: Color(0XFF1875D3),
                          width: 0.5,
                      )
                    ])),
              SizedBox(height: 20,),
              Text("Available Doctors", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.3)),
              SizedBox(height: 10,),
              Container(
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index){
                    return Card(
                      color: Colors.white,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Color(0XFF1875D3),
                                    child: Text("A", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),)
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Dr. Ramchand S", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15),),
                                    Text("CARDIOLOGY", style: GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 13),),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0XFF1875D3),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Available",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 13
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: 20,),
              Text("Pharmacy Collections", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.3)),
              SizedBox(height: 10,),
              Container(
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 20),
                  tooltipBehavior: _tooltip,
                  series: <CartesianSeries<_ChartData, String>>[
                    LineSeries<_ChartData, String>(
                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      name: 'patients',
                      color: Color(0XFF1875D3),
                      width: 2.0, // You can adjust the width to change the line thickness
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Doctors overview", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.3)),
              SizedBox(height: 10,),
              PieChartWidget(sectors),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}


