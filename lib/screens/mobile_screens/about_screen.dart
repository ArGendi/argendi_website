import 'package:AG/screens/desktop_screens/new_browser_screen.dart';
import 'package:AG/screens/home_screen.dart';
import 'package:AG/screens/mobile_screens/contact_us_screen.dart';
import 'package:AG/screens/mobile_screens/home_mobile_screen.dart';
import 'package:AG/screens/mobile_screens/new_mobile_screen.dart';
import 'package:AG/screens/privacy_policy_screen.dart';
import 'package:AG/widgets_mobile/bottom.dart';
import 'package:flutter/material.dart';

class AboutMobileScreen extends StatefulWidget {
  const AboutMobileScreen({super.key});

  @override
  State<AboutMobileScreen> createState() => _AboutMobileScreenState();
}

class _AboutMobileScreenState extends State<AboutMobileScreen> {
  ScrollController scrollController = ScrollController();

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
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'WHO WE ARE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenSize.width * 0.20,
                      fontFamily: 'Rainly',
                      color: Colors.grey[200],
                      height: 0.8
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                          //fontFamily: 'Rainly',
                          //color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        'ArGendi',
                        style: TextStyle(
                          fontSize: 50,
                          height: 1,
                          fontFamily: 'Rainly',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  children: [
                    Text(
                      'Our Story: Crafting Innovation, Building Tomorrow',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Rainly',
                        height: 1
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Welcome to ArGendi, where innovation is our heartbeat, and every line of code is a brushstroke on the canvas of the future. Our journey began with a shared vision – a vision to redefine what's possible, to break barriers, and to leave an indelible mark on the digital landscape.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Material(
                  elevation: 10,
                  child: Image.asset(
                    'images/girl.jpg',
                    //width: 350,
                    height: 450,
                    fit: BoxFit.cover,
                  ),
                ),
                
              ],
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  children: [
                    Text(
                      'Inception',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Rainly',
                        height: 1
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "It all started when a group of passionate individuals with diverse backgrounds and expertise came together. Fueled by a common love for technology and a desire to create meaningful solutions, ArGendi was born. We realized that the world was evolving, and we wanted to be at the forefront of that evolution.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Material(
                  elevation: 10,
                  child: Image.asset(
                    'images/inspection.jpg',
                    //width: 350,
                    height: 470,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  children: [
                    Text(
                      'Looking Ahead',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Rainly',
                        height: 1
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "As we reflect on our journey so far, we're humbled by the projects we've been a part of and the relationships we've built. Yet, our eyes are firmly set on the horizon. The future holds endless possibilities, and we're excited to continue pushing the boundaries of technology, creating solutions that inspire and innovate. Join us at ArGendi as we embark on the next chapter of our story – a story of growth, collaboration, and pioneering the future of development.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Material(
                  elevation: 10,
                  child: Image.asset(
                    'images/look_ahead.jpg',
                    //width: 350,
                    height: 450,
                    fit: BoxFit.cover,
                  ),
                ),
                
              ],
            ),
          ),
          const SizedBox(height: 50,),
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