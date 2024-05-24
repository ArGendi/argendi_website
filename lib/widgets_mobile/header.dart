import 'dart:async';

import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with TickerProviderStateMixin{
  double bottom = 0;
  late Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset(
            'images/developer_team.jpg',
            width: double.infinity,
            height: 380,
            fit: BoxFit.cover,
          ),
        ),
        const Center(
          child: Opacity(
            opacity: 0.7,
            child: Text(
              'AG',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 200,
                fontFamily: 'Rainly'
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Container(
            width: double.infinity,
            height: 380,
            color: Colors.black,
            child: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Digital Consultancy\nSoftware Development',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    height: 1.2
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  'We empower businesses by providing cutting-edge digital solutions that solve complex business challenges,\ndeveloped by our in-house team.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
          ),
        ),
        Positioned(
          bottom: bottom,
          left: screenSize.width * 0.5 - 100,
          child: Material(
            elevation: 15,
            shadowColor: Colors.grey,
            child: Container(
              color: Colors.white,
              width: 200,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'What we do ?',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}