

import 'package:AG/screens/desktop_screens/about_screen.dart';
import 'package:AG/screens/home_screen.dart';
import 'package:AG/screens/mobile_screens/about_screen.dart';
import 'package:AG/screens/mobile_screens/home_mobile_screen.dart';
import 'package:AG/screens/mobile_screens/new_mobile_screen.dart';
import 'package:AG/widgets_mobile/bottom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsMobileScreen extends StatefulWidget {
  const ContactUsMobileScreen({super.key});

  @override
  State<ContactUsMobileScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsMobileScreen> {
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
                Navigator.popUntil(context, (route) => route.isFirst);
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
          ],
        ),
      ),
       appBar: AppBar(
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
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                "images/FRANKFURT.png",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                     const Text(
                        "Contact us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                      const Text(
                        "Our regional team are ready to help you, get in touch today.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          //fontSize: 18,
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
                        child: const Text(
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
          const SizedBox(height: 50,),
          Column(
            mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 8,
                child: Image.asset(
                  "images/germany.jpg",
                  width: 280,
                  height: 330,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20,),
              const Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hamburg, Germany",
                    style: TextStyle(
                      fontSize: 24,
                      height: 1
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
          const SizedBox(height: 50,),
          Column(
            mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Material(
                elevation: 8,
                child: Image.asset(
                  "images/egypt.jpg",
                  width: 280,
                  height: 330,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20,),
              const Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cairo, Egypt",
                    style: TextStyle(
                      fontSize: 22,
                      height: 1
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
              
            ],
          ),
          const SizedBox(height: 50,),
          //const Spacer(),
          const Bottom(
            //inContactUs: true,
          ),
        ],
      ),
    );
  }
}