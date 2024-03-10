import 'package:flutter/material.dart';

import 'package:zerowaste111/Screens/welcome2.dart';

class welcome1 extends StatelessWidget {
  const welcome1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EFE9),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
                Navigator.push((context),
                    MaterialPageRoute(builder: (context) => const welcome2()));
              },
              child: const Image(
                image: AssetImage("assets/Images/bg1.png"),
              ),
            ),
          ),
          const Text(
            '"Connecting Hearts, \nReducing Food Waste\n Impact."',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFC4AD86),
              fontSize: 29,
              fontFamily: 'SeoulHangang CEB',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}


//Welcome 1