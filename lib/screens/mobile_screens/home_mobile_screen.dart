

import 'package:AG/screens/desktop_screens/about_screen.dart';
import 'package:AG/screens/mobile_screens/about_screen.dart';
import 'package:AG/screens/mobile_screens/contact_us_screen.dart';
import 'package:AG/screens/mobile_screens/new_mobile_screen.dart';
import 'package:AG/screens/mobile_screens/wheel_screen.dart';
import 'package:AG/widgets_mobile/bottom.dart';
import 'package:AG/widgets_mobile/header.dart';
import 'package:AG/widgets_mobile/our_develop_process.dart';
import 'package:AG/widgets_mobile/what_we_do_mobile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeMobileScreen extends StatefulWidget {
  const HomeMobileScreen({super.key});

  @override
  State<HomeMobileScreen> createState() => _HomeMobileScreenState();
}

class _HomeMobileScreenState extends State<HomeMobileScreen> {
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
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            const SizedBox(height: 20,),
            ListTile(
              onTap: (){
                Navigator.pop(context);
              },
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            // ListTile(
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.push(
            //       context, 
            //       PageRouteBuilder(
            //           pageBuilder: (context, animation1, animation2) => const NewMobileScreen(),
            //           transitionDuration: Duration.zero,
            //           reverseTransitionDuration: Duration.zero,
            //       ),
            //     );
            //   },
            //   title: const Text(
            //     'New',
            //     style: TextStyle(
            //       color: Colors.white
            //     ),
            //   ),
            // ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const ContactUsMobileScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              title: const Text(
                'Conatct us',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const AboutMobileScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              title: const Text(
                'About',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            // ListTile(
            //   onTap: (){
            //     Navigator.pop(context);
            //     Navigator.push(
            //       context, 
            //       PageRouteBuilder(
            //           pageBuilder: (context, animation1, animation2) => const WheelScreen(),
            //           transitionDuration: Duration.zero,
            //           reverseTransitionDuration: Duration.zero,
            //       ),
            //     );
            //   },
            //   title: const Text(
            //     'Sale',
            //     style: TextStyle(
            //       color: Colors.white
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
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
        centerTitle: true,
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
              'Our latest Projects',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Rainly'
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "images/p1_mockup_mobile.png",
                  width: 280,
                ),
                const SizedBox(height: 10,),
                const Column(
                  children: [
                    Text(
                      "BOD Evaluation SGC",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Provides a distinguished service for evaluating boards of directors and their affiliated committees",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //fontSize: 18,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                Image.asset(
                  "images/p3_mockup_mobile.png",
                  width: 300,
                ),
                const Column(
                  children: [
                    Text(
                      "NoonBrew",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    //SizedBox(height: 10,),
                    Text(
                      "NoonBrew is an organic iced tea blended with 19 superfoods to help boost your energy, focus, and digestion",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //fontSize: 18,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "images/sport_mockup_mobile.png",
                  width: 280,
                ),
                const Column(
                  children: [
                    Text(
                      "PowerWave Life",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    //SizedBox(height: 10,),
                    Text(
                      "Revolutionary workouts and nutrition plans now available via our powerful and engaging PowerWave™ Fitness App.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //fontSize: 18,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 50,),
          // const Center(
          //   child: Text(
          //     'What are you waiting for ?',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       fontSize: 36,
          //       fontFamily: 'Rainly'
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 10,),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Text(
          //         "Let's contact",
          //         style: TextStyle(
          //           fontSize: 20,
          //           //fontFamily: 'Rainly'
          //         ),
          //       ),
          //       const Text('Enter your phone number and project idea and we will call you as soon as possible'),
          //       const SizedBox(height: 10,),
          //       Material(
          //         elevation: 10,
          //         child: SizedBox(
          //           width: screenSize.width,
          //           height: 60,
          //           child: TextField(
          //             controller: phoneController,
          //             cursorColor: Colors.grey[700],
          //             decoration: const InputDecoration(
          //               enabledBorder: InputBorder.none,
          //               focusedBorder: InputBorder.none,
          //               hintText: 'Phone number or Email address',
          //               contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          //             ),
          //           ),
          //         ),
          //       ),
          //       const SizedBox(height: 10,),
          //       Material(
          //         elevation: 10,
          //         child: SizedBox(
          //           width: screenSize.width,
          //           height: 60,
          //           child: TextField(
          //             controller: projectController,
          //             cursorColor: Colors.grey[700],
          //             decoration: const InputDecoration(
          //               enabledBorder: InputBorder.none,
          //               focusedBorder: InputBorder.none,
          //               hintText: "What's your project ?",
          //               contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          //             ),
          //           ),
          //         ),
          //       ),
          //       if(textFieldError)
          //         const Text(
          //           'Enter both phone number/email address and your project idea',
          //           style: TextStyle(
          //             color: Colors.red
          //           ),
          //         ),
          //       const SizedBox(height: 20,),
          //       InkWell(
          //         onTap: (){
          //           onSendNow();
          //         },
          //         child: Container(
          //           width: screenSize.width,
          //           height: 60,
          //           color: Colors.black,
          //           child: const Center(
          //             child: Text(
          //               'Send Now',
          //               style: TextStyle(
          //                 fontSize: 25,
          //                 //fontWeight: FontWeight.bold,
          //                 fontFamily: "Rainly",
          //                 color: Colors.white
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20,),
          const Bottom(),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}