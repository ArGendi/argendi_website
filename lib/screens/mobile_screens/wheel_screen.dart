import 'dart:math';

import 'package:flutter/material.dart';

class WheelScreen extends StatefulWidget {
  const WheelScreen({super.key});

  @override
  State<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  int counter = 0;
  bool appearPromoCode = false;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sales"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 20,),
                  const Text(
                    "Our brands",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 1100,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (_, i) => Image.asset(
                    "images/${i+1}.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  itemCount: 12,
                ),
              ),
              //const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 20,),
                  const Text(
                    "Get Sale Now",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              image != null ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image!, width: 200, height: 200, fit: BoxFit.fill,),
                ],
              ) :
              SizedBox( height: 200, child: const Center(child:  Text("?", style: TextStyle( fontSize: 60),))),
              const SizedBox(height: 20,),
              if(!appearPromoCode)
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async{
                    for(int i=1; i<50; i++){
                      await Future.delayed(Duration(milliseconds: ((i) * pi * 3).toInt()), (){
                        setState(() {
                          int number = (i % 12) + 1;
                          image = "images/$number.png";
                        });
                      });
                    }
                    setState(() {
                      image = "images/7.png";
                      appearPromoCode = true;
                    });
                    await Future.delayed( const Duration(seconds: 3));
                    setState(() {
                      image = "images/qrcode.png";
                    });
                  }, 
                  child: Text("Start"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              if(appearPromoCode)
              const Text("Your promo code for 30% one piece order \nor 40% two pieces order", textAlign: TextAlign.center,),
              if(appearPromoCode)
              Center(
                child: const Text(
                  "KJ22",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}