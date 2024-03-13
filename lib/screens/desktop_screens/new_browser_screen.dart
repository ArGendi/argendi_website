
import 'package:AG/screens/desktop_screens/about_screen.dart';
import 'package:AG/screens/desktop_screens/contact_us_screen.dart';
import 'package:AG/screens/desktop_screens/home_browser_screen.dart';
import 'package:AG/screens/home_screen.dart';
import 'package:AG/screens/privacy_policy_screen.dart';
import 'package:AG/widgets_browser/bottom.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewScreen> with TickerProviderStateMixin {
  bool getData = false;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  late AnimationController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController = ScrollController();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    fadeAnimation = CurvedAnimation(
      parent: controller, 
      curve: Curves.linear,
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    controller.forward();

  }

  void scrollDown(){
    scrollController.animateTo(
      scrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 800), 
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              color: Colors.white
            ),
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
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
          TextButton(
            onPressed: (){
              scrollController.animateTo(
                scrollController.position.minScrollExtent, 
                duration: const Duration(seconds: 1), 
                curve: Curves.easeOut,
              );
            }, 
            child: const Text(
              "New",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: (){
                Navigator.push(
                context, 
                PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const ContactUsScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                ),
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: scrollDown,
                    child: Container(
                      height: 500,
                      width: screenSize.width * 0.5,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        //borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: SlideTransition(
                          position: slideAnimation,
                          child: FadeTransition(
                            opacity: fadeAnimation,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'images/logo.png',
                                    width: 80,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Text(
                                  'Orga.',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Organizer app for tailors',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                    child: Text('New'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: GestureDetector(
                    onTap: scrollDown,
                    child: Material(
                      elevation: 6,
                      //borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 500,
                        //width: screenSize.width * 0.5,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          //borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: SlideTransition(
                            position: slideAnimation,
                            child: FadeTransition(
                              opacity: fadeAnimation,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Orders now are\neasy to track', 
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                 Image.asset(
                                  'images/mockuper.png',
                                  width: 250,
                                 ),
                                 const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text(
                                      'Reuse clients\ndata', 
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                     ),
                                     SizedBox(height: 120,),
                                   ],
                                 ),
                                 
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          const Padding(
            padding:  EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider(endIndent: 20,)),
                Text(
                  'New Release',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //color: Colors.white,
                  ),
                ),
                Expanded(child: Divider(indent: 20,)),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Column(
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    "Organize your orders now\nDownload now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Coming soon on",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            //fontSize: 16,
                          ),
                        ),
                        Image.asset(
                          'images/Google_Play_logo.png',
                          width: 200,
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(width: 40,),
              Image.asset(
                'images/mobile2.png',
                width: 400,
              ),
              const SizedBox(width: 40,),
              const Text(
                  textAlign: TextAlign.center,
                  "Get access to your orders\nFaster than ever",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 40,),
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