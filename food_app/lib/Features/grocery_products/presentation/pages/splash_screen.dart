import 'dart:async';

import 'package:ecommerce_app/Features/grocery_products/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () async {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    });
    return Scaffold(
      body: Stack(
        children: [
          // Use BoxFit.cover to ensure the image covers the entire screen
          Positioned.fill(
            child: Image.asset(
              'assets/welcome.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
