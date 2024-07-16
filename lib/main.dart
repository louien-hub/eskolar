// main.dart
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for SystemChrome
import 'signup.dart'; // Import the second page file
import 'login.dart';
import 'app.dart';
import 'avail.dart';
import 'form.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // make status bar transparent
    statusBarIconBrightness: Brightness.dark, // set status bar icons' color to black
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark, // navigation bar icons' color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => GetStartedPage(),
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/avail': (context) => AvailPage(),
        '/app': (context) => ApplicationPage(),
        '/form': (context) => FormPage()
      },
    );
  }
}

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Stack(
          children: [
            Container(
              child: Positioned(
                top: 50, // Adjust the top position as needed
                left: 16,
                right: 16,
                child: Container(
                  height: 380, // Adjust this height as needed
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset('assets/img.png'),
                  ),
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'E-Skolar ng Bayan:\nAn Educational Assistance Program',
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text('Get Started!'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
