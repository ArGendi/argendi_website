import 'package:flutter/material.dart';

class OurDevelopProcess extends StatefulWidget {
  const OurDevelopProcess({super.key});

  @override
  State<OurDevelopProcess> createState() => _OurDevelopProcessState();
}

class _OurDevelopProcessState extends State<OurDevelopProcess> {
  bool defineHover = false;
  bool frontEndHover = false;
  bool backEndHover = false;
  bool supportHover = false;

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
                opacity: 0.9,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    mouseCursor: MouseCursor.defer,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.white,
                    onHover: (val){
                      setState(() {
                        defineHover = val;
                      });
                    },
                    onTap: (){},
                    child: Material(
                      elevation: defineHover ? 20 : 5,
                      shadowColor: Colors.grey[50],
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Define',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'We can take your visual product requirements and create a clear technical plan\nof action that our engineers can use to build your product.'
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: InkWell(
                    mouseCursor: MouseCursor.defer,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.white,
                    onHover: (val){
                      setState(() {
                        frontEndHover = val;
                      });
                    },
                    onTap: (){},
                    child: Material(
                      elevation: frontEndHover ? 20 : 5,
                      shadowColor: Colors.grey[50],
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Front-End',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'We use the latest emerging technology such as Flutter and Javascript to code your product’s front-end infrastructure.'
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    mouseCursor: MouseCursor.defer,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.white,
                    onHover: (val){
                      setState(() {
                        backEndHover = val;
                      });
                    },
                    onTap: (){},
                    child: Material(
                      elevation: backEndHover ? 20 : 5,
                      shadowColor: Colors.grey[50],
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Back-End',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'We have skilled back-end engineers that can connect your product to API protocols and scalable instances so you can deploy your product worldwide.'
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: InkWell(
                    mouseCursor: MouseCursor.defer,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.white,
                    onHover: (val){
                      setState(() {
                        supportHover = val;
                      });
                    },
                    onTap: (){},
                    child: Material(
                      elevation: supportHover ? 20 : 5,
                      shadowColor: Colors.grey[50],
                      child: const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Support',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'We support existing projects and create monthly reports for your software\nto ensure you’re up to date with the latest technology available.'
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}