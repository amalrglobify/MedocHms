import 'package:auto_route/auto_route.dart';
import 'package:medochms/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../rest/hive_repo.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // Track the expanded state of each ExpansionTile
  bool _isProfileExpanded = false;
  bool _isReportsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                'User Name',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'user@example.com',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'A',
                  style: TextStyle(fontSize: 40.0, color: Colors.red),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0XFF333E9F), Color(0XFF77209F)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ),
          ExpansionTile(
            leading: Icon(Icons.person, color: _isProfileExpanded ? Color(0XFF77209F) : Color(0XFF3C001F)),
            title: Text(
              'Menu',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: _isProfileExpanded ? Color(0XFF77209F) : Color(0XFF3C001F),
              ),
            ),
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isProfileExpanded = expanded;
              });
            },
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.family_restroom_outlined, color: Color(0XFF3C001F)),
                title: Text('Room Details', style: GoogleFonts.poppins(),),
                onTap: () {
                  Navigator.pushNamed(context, '/profile/call');
                },
              ),
              ListTile(
                leading: Icon(Icons.developer_mode, color: Color(0XFF3C001F)),
                title: Text('Demo', style: GoogleFonts.poppins(),),
                onTap: () {
                  Navigator.pushNamed(context, '/profile/mail');
                },
              )
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.library_books, color: _isReportsExpanded ? Color(0XFF77209F) : Color(0XFF3C001F)),
            title: Text(
              'Reports',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: _isReportsExpanded ? Color(0XFF77209F) : Color(0XFF3C001F),
              ),
            ),
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isReportsExpanded = expanded;
              });
            },
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.library_books, color: Color(0XFF3C001F)),
                title: Text('Lab Bill Report', style: GoogleFonts.poppins(),),
                onTap: () {
                  context.pushRoute(LabBillReportRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.library_books, color: Color(0XFF3C001F)),
                title: Text('Procedure Bill Report', style: GoogleFonts.poppins(),),
                onTap: () {
                  context.pushRoute(ProcedureBillReportRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.library_books, color: Color(0XFF3C001F)),
                title: Text('Registration Report', style: GoogleFonts.poppins(),),
                onTap: () {
                  context.pushRoute(RegistrationReportRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.library_books, color: Color(0XFF3C001F)),
                title: Text('Revist Report', style: GoogleFonts.poppins(),),
                onTap: () {
                  context.pushRoute(RevisitReportRoute());
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.group, color: Color(0XFF3C001F)),
            title: Text('Users', style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
            onTap: () {
              Navigator.pushNamed(context, '/about/info');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Color(0XFF3C001F)),
            title: Text('Settings', style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
            onTap: () {
              Navigator.pushNamed(context, '/about/info');
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Color(0XFF3C001F)),
            title: Text('Logout', style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
            onTap: () {
              Navigator.pop(context);
              HiveRepo.instance.logout();
              context.pushRoute(SignInRoute(departmentValue: "", departmentId: ""));
            },
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
