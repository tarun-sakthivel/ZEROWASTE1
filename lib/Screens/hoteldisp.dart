import 'package:flutter/material.dart';
import 'package:zerowaste111/Components/kilo.dart';
import 'package:zerowaste111/Screens/Cart.dart';
import 'package:zerowaste111/Screens/detailspage.dart';

class hoteldisp extends StatefulWidget {
  String DonarName = "";
  String Donarcontact = "";
  String Donaraddress = "";
  DateTime _dateTime = DateTime.now();
  String Dob = "";
  int _currentindex = 1;

  List<String> Fooditems = [];
  List<String> ExpiryDate = [];
  Map<String, dynamic> myMap = {};

  hoteldisp(
      {required this.DonarName,
      required this.Dob,
      required this.Donaraddress,
      required this.Donarcontact,
      required this.Fooditems,
      required this.ExpiryDate,
      super.key});

  @override
  State<hoteldisp> createState() => _hoteldispState();
}

class _hoteldispState extends State<hoteldisp> {
  List<String> items = ["Rice", "Biriyani", "Fried Rice"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    height: 210,
                    width: 400,
                    child: const Image(
                      image: AssetImage("assets/Images/A2B.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.navigate_before),
                    iconSize: 52,
                    color: Colors.white,
                  ),
                ]),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Adyar Anandha \nBhavan",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          Donaraddress,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Brodipet Main Rd, Arundelpet, \nNellore, Andhra Pradesh 522002",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.location_on)
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Contacts",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.email),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "+91-9864736823",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.email),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "a2b@gmail.com",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Location",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Foods Available",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 8.0, bottom: 8.0),
                                    child: Text(
                                      "Items",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  for (int i = 0;
                                      i < Fooditems.length;
                                      i++) ...[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 22.0),
                                      child: Text(
                                        Fooditems[i],
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    )
                                  ]
                                ],
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, left: 15),
                                    child: Text(
                                      "Quantity",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 13.0, left: 10),
                                    child: Kilo(),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 24.0, left: 10),
                                    child: Kilo(),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 24.0, left: 10),
                                    child: Kilo(),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 24.0, left: 10),
                                    child: Kilo(),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, left: 15),
                                    child: Text(
                                      "Expiry Date",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  for (int i = 0;
                                      i < Fooditems.length;
                                      i++) ...[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1.0, left: 15),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 22.0),
                                            child: Text(
                                              ExpiryDate[i],
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingCartScreen(
                                        cartItems: items,
                                      )));
                        }, //Order sumbitted pakcage
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 42, 42, 42),
                          minimumSize: const Size(70, 40),
                          disabledForegroundColor:
                              const Color.fromARGB(255, 40, 39, 39)
                                  .withOpacity(0.38),
                          disabledBackgroundColor:
                              const Color.fromARGB(255, 44, 44, 44)
                                  .withOpacity(0.12),
                        ),
                        child: const Text(
                          "Go to Orders",
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
