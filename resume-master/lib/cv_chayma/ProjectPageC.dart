import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProjectPageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _buildProjectBlock(
            context,
            'E-commerce website development',
            'Tools : Bootstrap, PHP, MySQL',
            '06/2023',
          ),
          SizedBox(height: 20),
          _buildProjectBlock(
            context,
            'E-commerce website development',
            'Tools : ASP .NET, SQL Server, Bootstrap',
            '12/2023',
          ),
          SizedBox(height: 20),
          _buildProjectBlock(
            context,
            'Online library development',
            'Tools : Vue.js, PHP, Laravel',
            '01/2023',
          ),
        ],
      ),
    );
  }

  Widget _buildProjectBlock(BuildContext context, String title, String tools, String duration) {
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
              tools,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 4),
            Text(
              duration,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}