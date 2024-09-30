

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:medochms/Provider/dashboard/dashboard_provider.dart';
import 'package:medochms/Provider/doctors/doctors_provider.dart';
import 'package:medochms/Provider/revisit/revisit_Provider.dart';
import 'package:medochms/models/revisit/revisit_graph_model.dart';
import 'package:medochms/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/dashboard/dashboard_details_model.dart';
import '../models/doctors/doctors_available.dart';
import '../theme/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/pi_chart.dart';

@RoutePage()
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

extension DateComparison on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {

  List<_ChartData> chartData = [];
  late TooltipBehavior _tooltip;
  List<DashboardDetailsList> dashboardWidgetsList = [];
  List<DoctorsAvailableList> doctorsAvailableList = [];
  List<RevisitGraphDetailsList> revisitGraphDetailsList = [];
  double highestRevisitValue = 10;
  String revisitFirstDate = "";
  String revisitLastDate = "";

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    getDashboardDetails();
    getAvailableDoctorsList();
    getRevisitGraphDetails();
    super.initState();
  }

  Future<void> getDashboardDetails() async {
    dashboardWidgetsList = await ref.read(dashboardProvider).getDashboardDetails();
    setState(() {});
  }

  Future<void> getAvailableDoctorsList() async {
    doctorsAvailableList = await ref.read(doctorsProvider).getAvailableDoctors();
    setState(() {});
  }

  Future<void> getRevisitGraphDetails() async {
    revisitGraphDetailsList = await ref.read(revisitListProvider).getRevisitGraphDetails();

    DateTime now = DateTime.now();

    List<DateTime> last7Days = List.generate(7, (index) => now.subtract(Duration(days: index)));
    revisitFirstDate = DateFormat('dd/MM/yyyy').format(last7Days.last);
    revisitLastDate = DateFormat('dd/MM/yyyy').format(last7Days.first);

    Map<String, int> visitCounts = {
      'Sun': 0,
      'Mon': 0,
      'Tue': 0,
      'Wed': 0,
      'Thu': 0,
      'Fri': 0,
      'Sat': 0,
    };

    for (var item in revisitGraphDetailsList) {
      String toDay = item.toDay.toString();
      DateTime date = DateFormat('dd/MM/yyyy').parse(toDay);

      if (last7Days.any((d) => d.isSameDate(date))) {
        String dayOfWeek = DateFormat('EEE').format(date);


        int visitValue = int.tryParse(item.visit.toString()) ?? 0;
        visitCounts[dayOfWeek] = visitValue;
      }
    }

    chartData = last7Days.map((date) {
      String dayOfWeek = DateFormat('EEE').format(date);
      print("dayOfWeekdayOfWeekdayOfWeekdayOfWeekdayOfWeekdayOfWeekdayOfWeekdayOfWeek$dayOfWeek");
      return _ChartData(dayOfWeek, visitCounts[dayOfWeek]!);
    }).toList();

    highestRevisitValue = double.parse(visitCounts.values.reduce((a, b) => a > b ? a : b).toString());
    chartData = chartData.reversed.toList();

    setState(() {});
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
              backgroundColor: const Color(0XFFF3007E),
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
                                Text(dashboardWidgetsList.isNotEmpty ? dashboardWidgetsList[0].newIP.toString() : "", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
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
                                Text(dashboardWidgetsList.isNotEmpty ? dashboardWidgetsList[0].totalRevisit.toString() : "", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
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
                                Text(dashboardWidgetsList.isNotEmpty ? dashboardWidgetsList[0].totalPatients.toString() : "", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
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
                                Text(dashboardWidgetsList.isNotEmpty ? dashboardWidgetsList[0].admitted.toString() : "", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
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
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 18, // Default font size for the main text
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                    color: Colors.black, // Set a default text color
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: 'Revisit Graph (', style: TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(
                      text: '$revisitFirstDate - $revisitLastDate',
                      style: TextStyle(fontSize: 14), // Decreased font size for the dates
                    ),
                    TextSpan(text: ')', style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(minimum: 0, maximum: highestRevisitValue + 1, interval: highestRevisitValue/2),
                    tooltipBehavior: _tooltip,
                    series: <CartesianSeries<_ChartData, String>>[
                      ColumnSeries<_ChartData, String>(
                          dataSource: chartData,
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
              if(doctorsAvailableList.isNotEmpty)Container(
                child: ListView.builder(
                  itemCount: doctorsAvailableList.length,
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
                                    Text(doctorsAvailableList[index].name.toString(), style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15),),
                                    Text(doctorsAvailableList[index].department.toString(), style: GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 13),),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap : (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text('Shift Details'),
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height * 0.37,
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          child: Column(
                                            children: [
                                              Text('Dr. Ramchand S'),
                                              Table(
                                                border: TableBorder.all(),
                                                children: [
                                                  TableRow(
                                                    decoration: BoxDecoration(color: Colors.grey[300]),
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Days", style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Shift", style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Start Time", style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("End Time", style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ),
                                                    ],
                                                  ),
                                                  TableRow(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Sunday"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Evening"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("5:00 PM"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("11:00 PM"),
                                                      ),
                                                    ],
                                                  ),
                                                  TableRow(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Monday"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Morning"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("9:00 AM"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("5:00 PM"),
                                                      ),
                                                    ],
                                                  ),
                                                  TableRow(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Tuesday"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Afternoon"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("1:00 PM"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("9:00 PM"),
                                                      ),
                                                    ],
                                                  ),
                                                  TableRow(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Wed"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Evening"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("5:00 PM"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("11:00 PM"),
                                                      ),
                                                    ],
                                                  ),
                                                  TableRow(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Thursay"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Evening"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("5:00 PM"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("11:00 PM"),
                                                      ),
                                                    ],
                                                  ),
                                                  TableRow(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Friday"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Evening"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("5:00 PM"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("11:00 PM"),
                                                      ),
                                                    ],
                                                  ),
                                                  TableRow(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Saturday"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Evening"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("5:00 PM"),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("11:00 PM"),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            // Perform some action
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
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
                      dataSource: chartData,
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
  final int y;
}


