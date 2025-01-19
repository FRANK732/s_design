import 'package:flutter/material.dart';

//Not in use now
class ResourceDelegate {
  Image getLogo(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: 100,
      height: 100,
    );
  }

// Add more resource fetching methods as needed
}
