import 'package:AG/screens/desktop_screens/about_screen.dart';
import 'package:AG/screens/home_screen.dart';
import 'package:AG/screens/mobile_screens/about_screen.dart';
import 'package:AG/screens/mobile_screens/home_mobile_screen.dart';
import 'package:AG/screens/mobile_screens/new_mobile_screen.dart';
import 'package:AG/widgets_mobile/bottom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

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
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const NewMobileScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              title: const Text(
                'New',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Let's contact",
                    style: TextStyle(
                      fontSize: 24,
                      //fontFamily: 'Rainly'
                    ),
                  ),
                  const Text(
                    'Enter your phone number or Email and feel free to tell me what you want. We will contact you as soone as possible.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10,),
                  Material(
                    elevation: 10,
                    child: SizedBox(
                      width: screenSize.width,
                      height: 60,
                      child: TextField(
                        controller: phoneController,
                        cursorColor: Colors.grey[700],
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Phone number or Email address',
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Material(
                    elevation: 10,
                    child: SizedBox(
                      width: screenSize.width,
                      height: 60,
                      child: TextField(
                        controller: projectController,
                        cursorColor: Colors.grey[700],
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "How can I help you ?",
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
                      width: screenSize.width ,
                      height: 60,
                      color: Colors.black,
                      child: const Center(
                        child: Text(
                          'Send Now',
                          style: TextStyle(
                            fontSize: 25,
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
          ),
          const Spacer(),
          SizedBox(
            width: screenSize.width,
            child: const Bottom(
              inContactUs: true,
            ),
          ),
        ],
      ),
    );
  }
}