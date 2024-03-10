import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:zerowaste111/Components/bottom_navigation_bar.dart';
import 'package:zerowaste111/Components/donardisp.dart';
import 'package:zerowaste111/Screens/login.dart';

//Texteditor defining
TextEditingController Searcheditor =
    TextEditingController(text: Searchtext ?? "");

//Variables
String Searchtext = "";
String TITLE = "";
int _currentIndex = 0;

final GlobalKey<SliderDrawerState> _sliderDrawerkey =
    GlobalKey<SliderDrawerState>();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

  /* static void signOut(BuildContext context) {

    try {
      signOut(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signinpage()));
      print("User signed out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }*/
}

class _HomeState extends State<Home> {
  final GlobalKey<SliderDrawerState> _sliderDrawerkey =
      GlobalKey<SliderDrawerState>();
  /*Future<void> _signOut() async {
    try {
      signOut(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signinpage()));
      print("User signed out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }*/
  @override
  void initState() {
    if (_currentIndex == 0) {
      setState(() {
        TITLE = "ZEROWASTE";
      });
    } else if (_currentIndex == 1) {
      setState(() {
        TITLE = "Share the Bounty: Donate Surplus Food";
      });
    } else if (_currentIndex == 2) {
      setState(() {});
    } else if (_currentIndex == 3) {
      setState(() {
        TITLE = "COMMUNITY";
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliderDrawer(
      key: _sliderDrawerkey,
      appBar: SliderAppBar(
        drawerIcon: null,
        //trailing: Image.asset('assets/Page_assets/appbar_main.png',height: 50,),
        appBarHeight: 100,
        appBarColor: Color.fromRGBO(244, 239, 233, 1),
        /* flexibleSpace:
              Image.asset("assets/Page_assets/appbar_main.png", height: 300),*/

        //backgroundColor: Color.fromARGB(255, 255, 254, 254),
        title: Text(
          TITLE,
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
        trailing: null,
      ),
      slider: const MenuWidget(),
      child: const HomeMain(),
    ));
  }
}

////----------------------------------------------------------------------

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void getuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinuser = user;
        print(loggedinuser);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getuser();
    super.initState();
  }

  // late User loggedinuser;
  late User loggedinuser;
  late String message;
  final GlobalKey<SliderDrawerState> _sliderDrawerkey =
      GlobalKey<SliderDrawerState>();
  final int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(244, 239, 233, 1),
        bottomNavigationBar: buttomnavigator(
          index1: _currentIndex,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 14, bottom: 8),
                  child: SizedBox(
                    width: 420,
                    height: 55,
                    child: TextField(
                      controller: SearchController(),
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //This is the place where we add the search bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 10, right: 10),
                    child: Text(
                      "Donations Available",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8.0),
                    child: IconButton(
                      icon: const Icon(Icons.sort_outlined),
                      onPressed:
                          () {} //This is the place where we give the sorting function
                      ,
                    ),
                  )
                ],
              ),
              const donardisp(),
              const donardisp(),
              const donardisp(),
              const donardisp(),
              const donardisp(),
              const donardisp(),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  getuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        var loggedinuser = user;
        print(loggedinuser);
        return loggedinuser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 5, left: 5),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: const CircleAvatar(
                            radius: 48,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            "tar123@gmail.com",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Text(
                          "+91-9834628645",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        const Divider(),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Container(
              height: 400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                signOut(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            login())); //WE HAVE TO ADD THE LOGOUT BUTTON HERE ------------------------------
                              },
                              child: const Text(
                                'Sign Out',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.logout_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                //showConfirmationDialog(context);
                              },
                              child: const Text(
                                'Delete Account',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void signOut(BuildContext context) async {
  try {
    // Sign out from Firebase

    await FirebaseAuth.instance.signOut();
    print("User signed out");

    // Navigate back to the previous screen
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const login()));
  } catch (e) {
    print("Error signing out: $e");
    // Handle the error, if any
  }
}
