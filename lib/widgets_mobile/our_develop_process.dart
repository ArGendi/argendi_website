import 'package:flutter/material.dart';

class OurDevelopProcess extends StatefulWidget {
  const OurDevelopProcess({super.key});

  @override
  State<OurDevelopProcess> createState() => _OurDevelopProcessState();
}

class _OurDevelopProcessState extends State<OurDevelopProcess> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
            children: [
              Image.asset(
                'images/Network-Technology.jpg',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.black,
                  child: const Center(
                    child:  Text(
                      'Our develop process',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Material(
              elevation: 10,
              shadowColor: Colors.grey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Define',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'We can take your visual product requirements and create a clear technical plan of action that our engineers can use to build your product.'
                    ),
                  ],
                ),
              ),
            ),
          ),
          //const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Material(
              elevation: 10,
              shadowColor: Colors.grey,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Front-End',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'We use the latest emerging technology such as Flutter and Javascript to code your product’s front-end infrastructure.'
                    ),
                  ],
                ),
              ),
            ),
          ),
          //const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Material(
              elevation: 10,
              shadowColor: Colors.grey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Back-End',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'We have skilled back-end engineers that can connect your product to API protocols and scalable instances so you can deploy your product worldwide.'
                    ),
                  ],
                ),
              ),
            ),
          ),
          //const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Material(
              elevation: 10,
              shadowColor: Colors.grey,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'We support existing projects and create monthly reports for your software\nto ensure you’re up to date with the latest technology available.'
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: Material(
          //           elevation: 10,
          //           shadowColor: Colors.grey,
          //           child: SizedBox(
          //             height: 260,
          //             child: Padding(
          //               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     'Define',
          //                     style: TextStyle(
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   SizedBox(height: 10,),
          //                   Text(
          //                     'We can take your visual product requirements and create a clear technical plan\nof action that our engineers can use to build your product.'
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(width: 10,),
          //       Expanded(
          //         child: SizedBox(
          //           height: 260,
          //           child: Material(
          //             elevation: 10,
          //             shadowColor: Colors.grey,
          //             child: Padding(
          //               padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     'Front-End',
          //                     style: TextStyle(
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   SizedBox(height: 10,),
          //                   Text(
          //                     'We use the latest emerging technology such as Flutter and Javascript to code your product’s front-end infrastructure.'
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // //const SizedBox(height: 20,),
          // const Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: SizedBox(
          //           height: 300,
          //           child: Material(
          //             elevation: 10,
          //             shadowColor: Colors.grey,
          //             child: Padding(
          //               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     'Back-End',
          //                     style: TextStyle(
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   SizedBox(height: 10,),
          //                   Text(
          //                     'We have skilled back-end engineers that can connect your product to API protocols and scalable instances so you can deploy your product worldwide.'
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(width: 10,),
          //       Expanded(
          //         child: SizedBox(
          //           height: 300,
          //           child: Material(
          //             elevation: 10,
          //             shadowColor: Colors.grey,
          //             child: Padding(
          //               padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     'Support',
          //                     style: TextStyle(
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   SizedBox(height: 10,),
          //                   Text(
          //                     'We support existing projects and create monthly reports for your software\nto ensure you’re up to date with the latest technology available.'
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
      ],
    );
  }
}