import 'package:AG/screens/desktop_screens/contact_us_screen.dart';
import 'package:AG/screens/mobile_screens/contact_us_screen.dart';
import 'package:AG/screens/privacy_policy_screen.dart';
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  final bool inContactUs;
  const Bottom({super.key, this.inContactUs = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Feel free to tell us what you want.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            InkWell(
              onTap: (){
                if(!inContactUs){
                  Navigator.push(
                    context, 
                    PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => const ContactUsMobileScreen(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                    ),
                  );
                }
                
              },
              child: const Text(
                  'Contact us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const PrivacyPolicyScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                  ),
                );
              }, 
              child: const Text(
                'Privacy & policy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}