import 'package:flutter/material.dart';

class EducationPageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Background'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _buildEducationBlock(
            context,
            'Engineer\'s degree',
            'Institut International de Technologie (IIT Sfax)',
            '2022- Present',
            'Specialization : Software engineering and business intelligence',
          ),
          SizedBox(height: 20),
          _buildEducationBlock(
            context,
            'Bachelor\'s degree in Computer Science',
            'Higher Institute of Computer Science and Multimedia Sfax',
            '2019 - 2022',
            'Specialization : Big Data and Data Analysis',
          ),
          SizedBox(height: 20),
          _buildEducationBlock(
            context,
            'Baccalaureate',
            'El Khalij High School Sfax',
            '2019',
            'Section : Mathematics',
          ),
        ],
      ),
    );
  }

  Widget _buildEducationBlock(BuildContext context, String title, String institution, String duration, String description) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              institution,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 4),
            Text(
              duration,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(height: 12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
