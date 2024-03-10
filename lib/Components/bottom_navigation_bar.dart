import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zerowaste111/Screens/Education.dart';
import 'package:zerowaste111/Screens/Home.dart';
import 'package:zerowaste111/Screens/community.dart';
import 'package:zerowaste111/Screens/detailspage.dart';

int _currentIndex = 0;
int index1 = 0;

class buttomnavigator extends StatefulWidget {
  int index1;

  buttomnavigator({required this.index1, super.key});

  @override
  State<buttomnavigator> createState() => _buttomnavigatorState();
}

class _buttomnavigatorState extends State<buttomnavigator> {
  int index1 = 0;

  @override
  void initState() {
    // TODO: implement initState
    index1 = widget.index1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index1,
      height: 50.0,
      items: const <Widget>[
        Icon(
          Icons.home,
          size: 30,
          color: Colors.black,
        ),
        Icon(Icons.add, size: 30),
        Icon(
          Icons.school,
          size: 30,
          color: Colors.black,
        ),
        Icon(Icons.people_rounded, size: 30),
      ],
      color: const Color.fromARGB(255, 164, 164, 164),
      buttonBackgroundColor: const Color.fromARGB(255, 195, 195, 195),
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 100),
      onTap: (index) {
        setState(
          () {
            _currentIndex = index;
          },
        );

        print("index is equal to+++++++ $index");
        if (_currentIndex == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeMain()));
        } else if (_currentIndex == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const detailspage()));
        } else if (_currentIndex == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const education()));
        } else if (_currentIndex == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const community()));
        } else {
          // Handle other taps
        }
      },
    );
  }
}
/* switch (index) {
            case 0:
              // Navigate to Home Page
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
            case 1:
              // Navigate to Search Page
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
              break;
            case 2:
              // Navigate to Favorite Page
              Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage()));
              break;
            case 3:
              // Navigate to Profile Page
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              break;
          }*/