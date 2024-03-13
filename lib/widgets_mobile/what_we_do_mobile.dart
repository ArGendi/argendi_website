import 'package:flutter/material.dart';

class WhatWeDo extends StatelessWidget {
  const WhatWeDo({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your reliable web and app development partner',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'We make successful products that turn great ideas into user-friendly solutions for consumers and businesses.',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 30,),
          Container(
            height: 1,
            width: screenSize.width,
            color: Colors.grey,
          ),
          const SizedBox(height: 30,),
          const Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.diamond_outlined),
              SizedBox(width: 10,),
              Text(
                'Completely tailored software.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 20,),
          // const Row(
          //   //mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(Icons.diamond_outlined),
          //     SizedBox(width: 10,),
          //     Text(
          //       'Ongoing support and maintenance.',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 20,),
          const Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.diamond_outlined),
              SizedBox(width: 10,),
              Text(
                'Testing and quality assurance.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.diamond_outlined),
              SizedBox(width: 10,),
              Expanded(
                child: Text(
                  'Create detailed project plans outlining timelines.',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.diamond_outlined),
              SizedBox(width: 10,),
              Text(
                'Projects delivered on time, always.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.diamond_outlined),
              SizedBox(width: 10,),
              Text(
                'Transparent costs and support.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // const Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       child: Text(
          //         'Completely tailored software.',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 20,),
          //     Expanded(
          //       child: Text(
          //         'Ongoing support and maintenance.',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 50,),
          // const Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       child: Text(
          //         'Testing and quality assurance.',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 20,),
          //     Expanded(
          //       child: Text(
          //         'Create detailed project plans outlining timelines.',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ),
      
          //   ],
          // ),
          // const SizedBox(height: 50,),
          // const Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       child: Text(
          //         'Projects delivered on time, always.',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 20,),
          //     Expanded(
          //       child: Text(
          //         'Transparent costs and support.',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}