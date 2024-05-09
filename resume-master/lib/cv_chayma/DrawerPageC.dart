import 'package:flutter/material.dart';
import 'package:flutter_application_2/cv_chayma/CertificatesPageC.dart';
import 'package:flutter_application_2/cv_chayma/EducationPageC.dart';
import 'package:flutter_application_2/cv_chayma/InternshipsPageC.dart';
import 'package:flutter_application_2/cv_chayma/ProjectPageC.dart';
import 'package:flutter_application_2/main.dart';


class DrawerPageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.teal],
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpg"),
                radius: 80,
              ),
            ),
          ),

          ListTile(
            title: Text("Internships"),
            leading: Icon(Icons.work_history_rounded, color: Colors.teal),
            trailing: Icon(Icons.arrow_right, color: Colors.teal),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InternshipsPageC()),
              );
            },
          ),

          ListTile(
            title: Text("Educational Background"),
            leading: Icon(Icons.school_rounded, color: Colors.teal),
            trailing: Icon(Icons.arrow_right, color: Colors.teal),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EducationPageC()),
              );
            },
          ),

          ListTile(
            title: Text("Projects"),
            leading: Icon(Icons.file_copy_rounded, color: Colors.teal),
            trailing: Icon(Icons.arrow_right, color: Colors.teal),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjectPageC()),
              );
            },
          ),
          ListTile(
            title: Text("Certificats"),
            leading: Icon(Icons.account_box_rounded, color: Colors.teal),
            trailing: Icon(Icons.arrow_right, color: Colors.teal),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CertificatsPageC()),
              );
            },
          ),
          ListTile(
            title: Text("Back"),
            leading: Icon(Icons.assignment_return_rounded, color: Colors.teal),
            trailing: Icon(Icons.arrow_right, color: Colors.teal),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InitialPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
