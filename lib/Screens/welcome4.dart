import 'package:flutter/material.dart';
import 'package:zerowaste111/Screens/login.dart';
//import 'package:zerowaste11/Screens/login.dart';

class welcome4 extends StatelessWidget {
  const welcome4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/bg4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Text(
              'Give food to those in need !',
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
              'Your food items will be given to \nthose in need and a personal \nmessage will be sent to you!!',
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
                    MaterialPageRoute(builder: (context) => const login()));
              },
              child: Container(
                height: 50,
                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF43494C),
                ),
                //color: Color(0xFF43494C),
                child: const Center(
                  child: Text(
                    "Donate Now!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

//Welcome 4