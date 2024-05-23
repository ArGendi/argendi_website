// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:AG/screens/desktop_screens/about_screen.dart';
import 'package:AG/screens/desktop_screens/new_browser_screen.dart';
import 'package:AG/screens/home_screen.dart';
import 'package:AG/screens/mobile_screens/home_mobile_screen.dart';
import 'package:AG/widgets_browser/bottom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

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
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: (){
            Navigator.popUntil(context, (route) => route.isFirst);
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
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text(
              "Home",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          // TextButton(
          //   onPressed: (){
          //     Navigator.push(
          //       context, 
          //       PageRouteBuilder(
          //           pageBuilder: (context, animation1, animation2) => const NewScreen(),
          //           transitionDuration: Duration.zero,
          //           reverseTransitionDuration: Duration.zero,
          //       ),
          //     );
          //   }, 
          //   child: const Text(
          //     "New",
          //     style: TextStyle(
          //       color: Colors.grey,
          //     ),
          //   ),
          // ),
          TextButton(
            onPressed: (){}, 
            child: const Text(
              "Contact us",
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
        children: [
          Stack(
            children: [
              Image.asset(
                "images/FRANKFURT.png",
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Contact us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                        ),
                      ),
                      Text(
                        "Our regional team are ready to help you, get in touch today.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      InkWell(
                        onTap: () async{
                          try{
                            final Uri params = Uri(
                              scheme: 'mailto',
                              path: 'projects@argendi.com',
                            );
                            if (await canLaunchUrl(params)) {
                              await launchUrl(params);
                            } else {
                              print( 'Could not launch $params');
                            }
                          }
                          catch(e){
                            print(e);
                          }
                        },
                        child: Text(
                          "Email: projects@argendi.com",
                          style: TextStyle(
                            color: Colors.white,
                            //fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 8,
                child: Image.asset(
                  "images/germany.jpg",
                  width: 300,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 200,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hamburg,",
                    style: TextStyle(
                      fontSize: 22,
                      height: 1
                    ),
                  ),
                  Text(
                    "Germany",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "Rudolf-Roß-Allee, Hamburg, Germany",
                    style: TextStyle(),
                  ),
                  Text(
                    "Call: (+49) 1573 1390129",
                    style: TextStyle(),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           "Austria,",
          //           style: TextStyle(
          //             fontSize: 22,
          //             height: 1
          //           ),
          //         ),
          //         Text(
          //           "Vienna",
          //           style: TextStyle(
          //             fontSize: 17,
          //           ),
          //         ),
          //         Text(
          //           "Any address in austria",
          //           style: TextStyle(),
          //         ),
          //         Text(
          //           "Call: (374) 2876 323",
          //           style: TextStyle(),
          //         ),
          //       ],
          //     ),
          //     SizedBox(width: 200,),
          //     Material(
          //       elevation: 8,
          //       child: Image.asset(
          //         "images/austria.jpg",
          //         width: 250,
          //         height: 300,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cairo,",
                    style: TextStyle(
                      fontSize: 22,
                      height: 1
                    ),
                  ),
                  Text(
                    "Egypt",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "Maadi, Cairo, Egypt",
                    style: TextStyle(),
                  ),
                  Text(
                    "Call: (+20) 1227701988",
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(width: 200,),
              Material(
                elevation: 8,
                child: Image.asset(
                  "images/egypt.jpg",
                  width: 300,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 100,),
          //const Spacer(),
          const Bottom(
            //inContactUs: true,
          ),
        ],
      ),
    );
  }
}