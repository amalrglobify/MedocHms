import 'dart:async';
import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:excel/excel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html/parser.dart';
import 'package:medochms/Provider/revisit/revisit_Provider.dart';
import 'package:medochms/models/revisit/revisit_report_model.dart';
import 'package:medochms/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_native_html_to_pdf/flutter_native_html_to_pdf.dart';
import 'dart:convert';

@RoutePage()
class RevisitReportScreen extends ConsumerStatefulWidget {
  final String fromDate;
  final String toDate;
  const RevisitReportScreen({super.key, required this.fromDate, required this.toDate });

  @override
  ConsumerState<RevisitReportScreen> createState() => _RevisitReportScreenState(this.fromDate, this.toDate);
}

class _RevisitReportScreenState extends ConsumerState<RevisitReportScreen> {
  String? generatedPdfFilePath;
  final _flutterNativeHtmlToPdfPlugin = FlutterNativeHtmlToPdf();
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  WebViewController _con = WebViewController();
  String _html = "";
  String fromDate;
  String toDate;

  List<RevisitReportModel> revisitReportList = [];


  _RevisitReportScreenState(this.fromDate, this.toDate);

  setHTML(String email, String phone, String name) {
    _html += '''
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
        th, td {
        border: 1px solid #ddd; /* Optional: adds borders to cells */
        padding: 8px;
        text-align: left;
    }
            /* Style for the address column */
td:nth-child(3) { /* Assuming the address is the 9th column */
    max-width: 50px; /* Set a max width */
    overflow: visible; /* Allow overflow to be visible */
    word-wrap: break-word; /* Allow wrapping of long addresses */
    white-space: normal; /* Allow normal whitespace handling */
    height: auto; /* Allow the height to adjust based on content */
}
    
        
        /* Style for the phone number column */
td:nth-child(7) { /* Assuming the phone number is the 7th column */
    max-width: 10px; /* Set a max width */
    overflow: visible; /* Allow overflow to be visible */
    word-wrap: break-word; /* Allow wrapping of long numbers */
    white-space: normal; /* Allow normal whitespace handling */
}

        /* Style for the phone number column */
td:nth-child(5) { /* Assuming the phone number is the 7th column */
    max-width: 60px; /* Set a max width */
    overflow: visible; /* Allow overflow to be visible */
    word-wrap: break-word; /* Allow wrapping of long numbers */
    white-space: normal; /* Allow normal whitespace handling */
}
    /* Style for the address column */
td:nth-child(8) { /* Assuming the address is the 9th column */
    max-width: 30px; /* Set a max width */
    overflow: visible; /* Allow overflow to be visible */
    word-wrap: break-word; /* Allow wrapping of long addresses */
    white-space: normal; /* Allow normal whitespace handling */
    height: auto; /* Allow the height to adjust based on content */
}
  

        /* Style for the address column */
td:nth-child(9) { /* Assuming the address is the 9th column */
    max-width: 130px; /* Set a max width */
    overflow: visible; /* Allow overflow to be visible */
    word-wrap: break-word; /* Allow wrapping of long addresses */
    white-space: normal; /* Allow normal whitespace handling */
    height: auto; /* Allow the height to adjust based on content */
}
        /* Style for the address column */
td:nth-child(10) { /* Assuming the address is the 9th column */
    max-width: 100px; /* Set a max width */
    overflow: visible; /* Allow overflow to be visible */
    word-wrap: break-word; /* Allow wrapping of long addresses */
    white-space: normal; /* Allow normal whitespace handling */
    height: auto; /* Allow the height to adjust based on content */
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

    <h1>Revisit Report</h1>

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
                    <th>G</th>
                    <th>Address</th>
                    <th>Phone\nNumber</th>
                    <th>Revisit\nFee</th>
                    <th>Consult\nFee</th>
                    <th>Other\nFee</th>
                </tr>
            </thead>
            <tbody>''';
    for(int i=0; i<revisitReportList.length; i++){
      _html += '''<tr>
                    <td>${i+1}</td>
                    <td>${revisitReportList[i].regNo.toString()}</td>
                    <td>${getDateFromRegDate(revisitReportList[i].regDate.toString())}</td>
                    <td>${getTimeFromRegDate(revisitReportList[i].regDate.toString())}</td>
                    <td>${revisitReportList[i].pName}</td>
                    <td>${revisitReportList[i].fathersname}</td>
                    <td>${revisitReportList[i].age}</td>
                    <td>${revisitReportList[i].mothersname == "FEMALE" ? "F" : "M"}</td>
                    <td>${revisitReportList[i].address1}</td>
                    <td>${revisitReportList[i].phoneNo}</td>
                    <td>${revisitReportList[i].regFee}</td>
                    <td>${revisitReportList[i].consultFee}</td>
                    <td>${revisitReportList[i].otherFee}</td>
                </tr>''';
    }
    _html += '''
            
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

  String getTimeFromRegDate(String regDate) {
    List<String> parts = regDate.split('##');
    if (parts.length > 1) {
      return parts[1];
    } else {
      return '';
    }
  }

  String? getDateFromRegDate(String regDate) {
    List<String> parts = regDate.split('##');

    if (parts.isNotEmpty) {
      String dateString = parts[0];

      try {
        final DateTime date = DateTime.parse(
            "${dateString.split('/')[2]}-${dateString.split('/')[1]}-${dateString.split('/')[0]}");

        // Format the date to dd/MM/yyyy
        final DateFormat formatter = DateFormat('dd/MM/yyyy');
        return formatter.format(date);
      } catch (e) {
        print('Error parsing date: $e');
        return null;
      }
    } else {
      print('Invalid format');
      return null;
    }
  }

  Future<void> _generateExcel(String htmlContent) async {
    try {
      var document = parse(htmlContent);
      var rows = document.getElementsByTagName('tr');

      var excel = Excel.createExcel();
      Sheet sheet = excel['Sheet1'];

      for (var row in rows) {
        var cells = row.getElementsByTagName('th').isNotEmpty
            ? row.getElementsByTagName('th')
            : row.getElementsByTagName('td');

        List<dynamic> rowData = [];
        for (var cell in cells) {
          rowData.add(cell.innerHtml);
        }
        sheet.appendRow(rowData);
      }
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/Revisit Report.xlsx';
      final file = File(filePath);

      await file.writeAsBytes(await excel.encode()!);

      await Share.shareXFiles(
        [XFile(filePath)],
        text: 'Check out this Excel file!',
      );
    } catch (e) {
      print('Error generating Excel file: $e');
    }
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

    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;
    const targetFileName = "Revisit report";
    final generatedPdfFile =
    await _flutterNativeHtmlToPdfPlugin.convertHtmlToPdf(
      html: _html,
      targetDirectory: targetPath,
      targetName: targetFileName,
    );

    generatedPdfFilePath = generatedPdfFile?.path;
  }

  var _fromDate = TextEditingController();
  var _toDate = TextEditingController();

  void _setDefaultDates() {
    DateTime currentDate = DateTime.now();
    DateTime fromDateNew = currentDate.subtract(Duration(days: 30));

    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    if(fromDate.isEmpty){
      _fromDate.text = dateFormat.format(fromDateNew);
    }else{
      _fromDate.text = fromDate;
    }

    if(toDate.isEmpty){
      _toDate.text = dateFormat.format(fromDateNew);
    }else{
      _toDate.text = toDate;
    }
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



  Future<bool> _onWillPop() async {
    await context.pushRoute(const DashboardRoute());
    return false;
  }

  @override
  void initState() {
    super.initState();
    _setDefaultDates();
    getRevisitReportDetails();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarHeight: 120,
          leading: GestureDetector(
              onTap: (){
                context.pushRoute(const DashboardRoute());
              },
              child: Icon(Iconsax.arrow_left_2)),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Revisit Report",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String value) async{
                // Handle the selected action
                switch (value) {
                  case 'share':
                    await Share.shareXFiles(
                      [XFile(generatedPdfFilePath!)],
                      text: 'This is pdf file',
                    );
                    break;
                  case 'share as Excel':
                    await _generateExcel(_html);
                    break;
                  case 'download':
                    // await _requestPermissions();
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return const[
                  PopupMenuItem<String>(
                    value: 'share',
                    child: ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Share'),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'share as Excel',
                    child: ListTile(
                      leading: Icon(Icons.share),
                      title: Text('share as Excel'),
                    ),
                  ),
                  // PopupMenuItem<String>(
                  //   value: 'print',
                  //   child: ListTile(
                  //     leading: Icon(Icons.print),
                  //     title: Text('Print'),
                  //   ),
                  // ),
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
                              context.pushRoute(RevisitReportRoute(fromDate: _fromDate.text, toDate: _toDate.text));
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
      ),
    );
  }

  Future<void> getRevisitReportDetails() async {
    revisitReportList.clear();
    revisitReportList = await ref.read(revisitListProvider).getAllRevisitReportDetails(_fromDate.text, _toDate.text);
    _loadHTML();
    print(revisitReportList.length);
    setState(() {});
  }
}
