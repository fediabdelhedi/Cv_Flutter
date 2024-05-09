import 'package:flutter/material.dart';
import 'package:flutter_application_2/cv_chayma/CertificatesPageC.dart';
import 'package:flutter_application_2/cv_fedi/CertificatesPageF.dart';
import 'package:flutter_application_2/cv_fedi/EducationPageF.dart';
import 'package:flutter_application_2/cv_fedi/InternshipsPageF.dart';
import 'package:flutter_application_2/cv_fedi/ProjectPageF.dart';

import 'package:flutter_application_2/main.dart';


class DrawerPageF extends StatelessWidget {
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
                backgroundImage: AssetImage("assets/fedi.png"),
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
                MaterialPageRoute(builder: (context) => InternshipsPageF()),
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
                MaterialPageRoute(builder: (context) => EducationPageF()),
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
                MaterialPageRoute(builder: (context) => ProjectPageF()),
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
                MaterialPageRoute(builder: (context) => CertificatsPageF()),
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
