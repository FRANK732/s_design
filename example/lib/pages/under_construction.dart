import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({super.key, required this.pageTitle});
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 100,
              color: Colors.teal,
            ),
            SizedBox(height: 20),
            Text(
              'This package is under construction',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'More advanced and game changing features coming soon!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
