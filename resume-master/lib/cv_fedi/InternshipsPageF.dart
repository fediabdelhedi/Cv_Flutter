import 'package:flutter/material.dart';

class InternshipsPageF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internships'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _buildInternshipBlock(
            context,
            'End-of-Year Project',
            'Software Engineering Intern',
            'FOD',
            'Since March 2024',
            'Worked on developing a new website for an event planner.',
          ),

          SizedBox(height: 20),
          _buildInternshipBlock(
            context,
            'Summer Internship',
            'Business Intelligence Analyst',
            'CRNS',
            'July 2023',
            'Implemented CRM Decision Support Solution.',
          ),
          SizedBox(height: 20),
          _buildInternshipBlock(
            context,
            'End-of-Study Project',
            'WinDev Developer',
            'WinDev Developer',
            '02/2022-06/2022',
            'Conception and project development of customer service desktop application.',
          ),

        ],
      ),
    );
  }

  Widget _buildInternshipBlock(BuildContext context,String type, String title, String company, String duration, String description) {
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
              type,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 4),
            Text(
              company,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(height: 12),
            Text(
              duration,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
