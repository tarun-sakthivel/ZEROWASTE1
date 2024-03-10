import 'package:zerowaste111/Screens/welcome3.dart';
import 'package:flutter/material.dart';
//import 'package:zerowaste11/Screens/welcome1.dart';
// import 'package:zerowaste11/Screens/welcome3.dart';

class welcome2 extends StatelessWidget {
  const welcome2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 900,
        width: 600,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/Images/bg2.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Text(
              'Find a food bank near you ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'have food items dropped off at a\n local food bank or drive within\n close distance.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const welcome3()));
              },
              child: Container(
                height: 50,
                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF43494C),
                ),
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}


//Welcome 2