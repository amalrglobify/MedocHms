import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('user@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'U',
                style: TextStyle(fontSize: 40.0, color: Colors.red), // Change avatar text color to red
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green, // Background color of the drawer header
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.red), // Change icon color to red
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.red), // Change icon color to red
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.red), // Change icon color to red
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red), // Change icon color to red
            title: Text('Logout'),
            onTap: () {
              // Handle logout functionality
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
