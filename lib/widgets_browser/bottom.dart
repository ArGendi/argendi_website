// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:AG/screens/desktop_screens/contact_us_screen.dart';
import 'package:AG/screens/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Bottom extends StatelessWidget {
  final bool inContactUs;
  const Bottom({super.key, this.inContactUs = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Feel free to tell us what you want.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Contact us through ',
                      style: TextStyle(
                        color: Colors.white,
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
                        'projects@argendi.com',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                // InkWell(
                //   onTap: (){
                //     if(!inContactUs){
                //       Navigator.push(
                //         context, 
                //         PageRouteBuilder(
                //             pageBuilder: (context, animation1, animation2) => const ContactUsScreen(),
                //             transitionDuration: Duration.zero,
                //             reverseTransitionDuration: Duration.zero,
                //         ),
                //       );
                //     }
                    
                //   },
                //   child: const Text(
                //       'Contact us',
                //       style: TextStyle(
                //         color: Colors.white,
                //       ),
                //     ),
                // ),
              ],
            ),
            TextButton(
              onPressed: (){
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}