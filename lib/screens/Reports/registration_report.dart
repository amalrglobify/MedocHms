import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:medochms/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';

@RoutePage()
class RegistrationReportScreen extends StatefulWidget {
  const RegistrationReportScreen({super.key});

  @override
  State<RegistrationReportScreen> createState() => _RegistrationReportScreenState();
}

class _RegistrationReportScreenState extends State<RegistrationReportScreen> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  WebViewController _con = WebViewController();
  String _html = "";


  setHTML(String email, String phone, String name) {
    _html = '''
   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport",initial-scale=1.0">
    <title>Hospital Bill Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 100%;
            margin: 20px auto;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
        }
        h1 {
            text-align: center;
            color: #0056b3;
        }
        .header, .content, .footer {
            margin-bottom: 40px;
        }
        .header {
            border-bottom: 2px solid #0056b3;
            padding-bottom: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .header img {
            height: 70px;
        }
        .header h2 {
            margin-top: 20px;
        }
        .header p {
            padding:0px;
        }
        .content table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            table-layout: auto; /* Adjusts columns based on content */
        }
        .content table, .content th, .content td {
            border: 1px solid #ddd;
        }
        .content th, .content td {
            padding: 10px;
            text-align: left;
            word-wrap: break-word; /* Handle overflow */
        }
        .content th {
            background-color: #f4f4f4;
        }
        .footer {
            border-top: 2px solid #0056b3;
            padding-top: 10px;
            text-align: center;
        }
        .footer p {
            margin: 0;
        }
        .total {
            font-weight: bold;
        }
        .total td {
            text-align: right;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .header {
                flex-direction: column;
                text-align: center;
            }
            .header img {
                margin-bottom: 10px;
            }
            .content table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <img src="https://via.placeholder.com/150" alt="Hospital Logo">
            <h2>XYZ Hospital</h2>
            <p>123 Health Street, Wellness City, HC 12345</p>
    </div>

    <h1>Registration Report</h1>

    <div class="content">
        <table>
            <tr>
                <th>From Date</th>
                <td>${_fromDate.text}</td>
            </tr>
            <tr>
                <th>To Date</th>
                <td>${_toDate.text}</td>
            </tr>
        </table>

        <h2>Bill Details</h2>
        <table style="width: 100%;">
            <thead>
                <tr>
                    <th>Sl#</th>
                    <th>Reg#</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Patient</th>
                    <th>Doctor</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Phone\nNumber</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>4578</td>
                    <td>2024/09/15</td>
                    <td>12:00 PM</td>
                    <td>Amal</td>
                    <td>Doctor</td>
                    <td>35</td>
                    <td>Male</td>
                    <td>Technopark Phase 1, Kazhakkottam, Trivandrum</td>
                    <td>1234567890</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>4578</td>
                    <td>2024/09/15</td>
                    <td>12:00 PM</td>
                    <td>Amal</td>
                    <td>Doctor</td>
                    <td>35</td>
                    <td>Male</td>
                    <td>Technopark Phase 1, Kazhakkottam, Trivandrum</td>
                    <td>1234567890</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>4578</td>
                    <td>2024/09/15</td>
                    <td>12:00 PM</td>
                    <td>Amal</td>
                    <td>Doctor</td>
                    <td>35</td>
                    <td>Male</td>
                    <td>Technopark Phase 1, Kazhakkottam, Trivandrum</td>
                    <td>1234567890</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>4578</td>
                    <td>2024/09/15</td>
                    <td>12:00 PM</td>
                    <td>Amal</td>
                    <td>Doctor</td>
                    <td>35</td>
                    <td>Male</td>
                    <td>Technopark Phase 1, Kazhakkottam, Trivandrum</td>
                    <td>1234567890</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="footer">
        <p>Thank you for choosing XYZ Hospital. If you have any questions about this bill, please contact our billing department at (123) 456-7890.</p>
        <p>XYZ Hospital | 123 Health Street, Wellness City, HC 12345</p>
    </div>
</div>

</body>
</html>



  ''';
  }


  _loadHTML() async {
    setHTML(
        "connelblaze@gmil.com",
        "+2347034857296",
        "Connel Asikong"
    );
    _con..loadRequest(Uri.dataFromString(
        _html,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ));
  }

  var _fromDate = TextEditingController();
  var _toDate = TextEditingController();

  void _setDefaultDates() {
    DateTime currentDate = DateTime.now();
    DateTime fromDate = currentDate.subtract(Duration(days: 30));

    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    _fromDate.text = dateFormat.format(fromDate);
    _toDate.text = dateFormat.format(currentDate);
  }

  void _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: Colors.blue,
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            textTheme: const TextTheme(
              headlineSmall: TextStyle(
                color: Colors.blue,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
        controller.text = formattedDate;
      });
    }
  }


  @override
  void initState() {
    super.initState();
    _setDefaultDates();
    _loadHTML();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 120,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Registration Report",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              // Handle the selected action
              switch (value) {
                case 'share':
                // Handle share action
                  print('Share clicked');
                  break;
                case 'download':
                // Handle download action
                  print('Download clicked');
                  break;
                case 'print':
                // Handle print action
                  print('Print clicked');
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'share',
                  child: ListTile(
                    leading: Icon(Icons.share),
                    title: Text('Share'),
                  ),
                ),
                PopupMenuItem<String>(
                  onTap: () async {

                  },
                  value: 'download',
                  child: ListTile(
                    leading: Icon(Icons.download),
                    title: Text('Download'),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'print',
                  child: ListTile(
                    leading: Icon(Icons.print),
                    title: Text('Print'),
                  ),
                ),
              ];
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.share, // Use an appropriate icon here
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10), // Adjust height as needed
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("From Date", style: GoogleFonts.poppins(color: Colors.grey),),
                      ),
                      TextFormField(
                        controller: _fromDate,
                        readOnly: true,
                        onTap: () => _selectDate(context, _fromDate),
                        decoration: InputDecoration(
                          hintText: 'From Date',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("To Date", style: GoogleFonts.poppins(color: Colors.grey),),
                      ),
                      TextFormField(
                        controller: _toDate,
                        readOnly: true,
                        onTap: () => _selectDate(context, _toDate),
                        decoration: InputDecoration(
                          hintText: 'To Date',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("", style: GoogleFonts.poppins(color: Colors.grey),),
                        ),
                        GestureDetector(
                          onTap: (){
                            context.pushRoute(LabBillReportRoute());
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0XFF333E9F), Color(0XFF77209F)],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight, // Define the gradient end
                              ),
                              borderRadius: BorderRadius.circular(10), // Optional border radius
                            ),
                            // color: Color(0XFF1875D3),
                            child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Iconsax.search_normal, color: Colors.white,),
                                    SizedBox(width: 8),
                                    Text("Search", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),),
                                  ],
                                )
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
      body: WebViewWidget(
        controller: _con,
      ),
    );
  }
}
