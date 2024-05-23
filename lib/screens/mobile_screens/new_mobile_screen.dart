
import 'package:AG/screens/mobile_screens/about_screen.dart';
import 'package:AG/screens/mobile_screens/contact_us_screen.dart';
import 'package:AG/screens/privacy_policy_screen.dart';
import 'package:AG/widgets_mobile/bottom.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NewMobileScreen extends StatefulWidget {
  const NewMobileScreen({super.key});

  @override
  State<NewMobileScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewMobileScreen> with TickerProviderStateMixin {
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
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    controller.forward();

  }

  void scrollDown(){
    scrollController.animateTo(
      scrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 1000), 
      curve: Curves.easeOut,
    );
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: screenSize.width,
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
            const SizedBox(height: 15,),
            Material(
              elevation: 10,
              shadowColor: Colors.grey,
              //borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 420,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           const Text(
                              'Reuse clients data', 
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                //color: Colors.white,
                                //fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 10,),
                          Image.asset(
                          'images/mockuper.png',
                          width: 180,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider(endIndent: 15,)),
                Text(
                  'New Release',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    //color: Colors.white,
                  ),
                ),
                Expanded(child: Divider(indent: 15,)),
              ],
            ),
            const SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    textAlign: TextAlign.center,
                    "Get access to your orders\nFaster than ever",
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  //const SizedBox(height: 10,),
                  Image.asset(
                  'images/mobile2.png',
                  width: 300,
                ),
                //const SizedBox(height: 10,),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      "Organize your orders now\nDownload now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
                          width: 170,
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ],
            ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const Bottom(),
        ],
      ),
    );
  }
}