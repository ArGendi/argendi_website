// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:AG/screens/desktop_screens/about_screen.dart';
import 'package:AG/screens/desktop_screens/new_browser_screen.dart';
import 'package:AG/screens/home_screen.dart';
import 'package:AG/screens/mobile_screens/home_mobile_screen.dart';
import 'package:AG/widgets_browser/bottom.dart';
import 'package:AG/widgets_browser/header.dart';
import 'package:AG/widgets_browser/our_develop_process.dart';
import 'package:AG/widgets_browser/what_we_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeBrowserScreen extends StatefulWidget {
  const HomeBrowserScreen({super.key});

  @override
  State<HomeBrowserScreen> createState() => _HomeBrowserScreenState();
}

class _HomeBrowserScreenState extends State<HomeBrowserScreen> with TickerProviderStateMixin{
  ScrollController scrollController = ScrollController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController projectController = TextEditingController();
  bool textFieldError = false;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          content: const Padding(
            padding:  EdgeInsets.symmetric(vertical: 20),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.mail_outline,
                  color: Colors.black,
                  size: 50,
                ),
                SizedBox(height: 5,),
                Text(
                  "We will contact you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Rainly',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showErrorDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline_outlined,
                  color: Colors.red[900],
                  size: 50,
                ),
                const SizedBox(height: 5,),
                const Text(
                  "Try again later",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Rainly',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void onSendNow() async{
    try{
      if(phoneController.text.isEmpty || projectController.text.isEmpty){
        setState(() {
          textFieldError = true;
        });
      }
      else{
        setState(() {
          textFieldError = false;
        });
        FirebaseFirestore.instance.collection('projects').add({
          'phone': phoneController.text.trim(),
          'project': projectController.text,
        }).then((value){
          _showMyDialog();
        });
      }
    }
    catch(e){
      _showErrorDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
        title: GestureDetector(
          onTap: (){
            scrollController.animateTo(
                scrollController.position.minScrollExtent, 
                duration: const Duration(seconds: 1), 
                curve: Curves.easeOut,
              );
          },
            child: const Text(
            "AG",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Rainly",
              fontSize: 30,
              color: Colors.black
            ),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: (){
              scrollController.animateTo(
                scrollController.position.minScrollExtent, 
                duration: const Duration(seconds: 1), 
                curve: Curves.easeOut,
              );
            },
            child: const Text(
              "Home",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.push(
                context, 
                PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const NewScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                ),
              );
            }, 
            child: const Text(
              "New",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: (){
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent, 
                  duration: const Duration(seconds: 1), 
                  curve: Curves.easeOut,
                );
             }, 
            child: const Text(
              "Contact us",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.push(
                context, 
                PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const AboutScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            child: const Text(
              "About",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        controller: scrollController,
        children: [
          const Header(),
          const SizedBox(height: 50,),
          const WhatWeDo(),
          const SizedBox(height: 50,),
          const OurDevelopProcess(),
          const SizedBox(height: 40,),
          const Center(
            child: Text(
              'What are you waiting for ?',
              style: TextStyle(
                fontSize: 60,
                fontFamily: 'Rainly'
              ),
            ),
          ),
          //const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Let's contact",
                        style: TextStyle(
                          fontSize: 24,
                          //fontFamily: 'Rainly'
                        ),
                      ),
                      const Text('Enter your phone number and project idea and we will call you as soon as possible'),
                      const SizedBox(height: 10,),
                      Material(
                        elevation: 10,
                        child: SizedBox(
                          width: screenSize.width * 0.45,
                          height: 60,
                          child: TextField(
                            controller: phoneController,
                            cursorColor: Colors.grey[700],
                            decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Phone number',
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Material(
                        elevation: 10,
                        child: SizedBox(
                          width: screenSize.width * 0.45,
                          height: 60,
                          child: TextField(
                            controller: projectController,
                            cursorColor: Colors.grey[700],
                            decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "What's your project ?",
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            ),
                          ),
                        ),
                      ),
                      if(textFieldError)
                        const Text(
                          'Enter both phone number/email address and your project idea',
                          style: TextStyle(
                            color: Colors.red
                          ),
                        ),
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          onSendNow();
                        },
                        child: Container(
                          width: screenSize.width * 0.45,
                          height: 60,
                          color: Colors.black,
                          child: const Center(
                            child: Text(
                              'Send Now',
                              style: TextStyle(
                                fontSize: 30,
                                //fontWeight: FontWeight.bold,
                                fontFamily: "Rainly",
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "AG",
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontFamily: "Rainly",
                    fontSize: 350,
                    color: Colors.grey.shade200,
                    height: 1
                  ),
                ),
              ],
            ),
          ),
          const Bottom(),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }
}