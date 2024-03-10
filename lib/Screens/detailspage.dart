import 'package:flutter/material.dart';
import 'package:zerowaste111/Components/bottom_navigation_bar.dart';
import 'package:zerowaste111/Components/kilo.dart';
import 'package:zerowaste111/Screens/Home.dart';
import 'package:zerowaste111/Screens/hoteldisp.dart';

TextEditingController DonarNameController =
    TextEditingController(text: DonarName ?? "");
TextEditingController DonarcontactController =
    TextEditingController(text: Donarcontact ?? "");

TextEditingController DonaraddressController =
    TextEditingController(text: Donaraddress ?? "");

String DonarName = "";
String Donarcontact = "";
String Donaraddress = "";
DateTime _dateTime = DateTime.now();
String Dob = "";
int _currentindex = 1;

List<String> Fooditems = [
  "Rice",
  "Biriyani",
  "Fried rice",
  "Pongal",
];
List<String> ExpiryDate = [
  "02.03.23",
  "03.03.23",
  "02.03.23",
  "02.03.23",
];
Map<String, dynamic> myMap = {
  'donarname': DonarNameController,
  'contact': DonarcontactController,
  'address': DonaraddressController,
};

class detailspage extends StatefulWidget {
  const detailspage({super.key});

  @override
  State<detailspage> createState() => _detailspageState();
}

class _detailspageState extends State<detailspage> {
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialDatePickerMode: DatePickerMode.day,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Adjust the primary color if needed
            // Adjust the accent color if needed
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          // Create a new DateTime instance without the time part
          _dateTime = DateTime(value.year, value.month, value.day);
          Dob = _dateTime.toString();
          //addFieldToUserDocument("DBdob", Dob);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: buttomnavigator(
          index1: _currentindex,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Share the Bounty: Donate\n \tSurplus Food",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  indent: 25,
                  endIndent: 25,
                  thickness: 1.5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 30),
                  child: Text(
                    "Enter Your Details",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Donar Name",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: 50,
                          width: 280,
                          child: TextField(
                            controller: DonarNameController,
                            decoration: const InputDecoration(
                              hintText: 'Type your name here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Contact",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: 50,
                          width: 280,
                          child: TextField(
                            controller: DonarcontactController,
                            decoration: const InputDecoration(
                              hintText: 'Type your contact here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Address",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: 50,
                          width: 280,
                          child: TextField(
                            controller: DonaraddressController,
                            decoration: const InputDecoration(
                              hintText: 'Type your address here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Foods Available",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
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
                                for (int i = 0; i < Fooditems.length; i++) ...[
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
                                  padding: EdgeInsets.only(top: 13.0, left: 10),
                                  child: Kilo(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 24.0, left: 10),
                                  child: Kilo(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 24.0, left: 10),
                                  child: Kilo(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 24.0, left: 10),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 1.0, left: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        Dob,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.calendar_month,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        onPressed: () {
                                          _showDatePicker();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 1.0, left: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        Dob,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.calendar_month,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        onPressed: () {
                                          _showDatePicker();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 1.0, left: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        Dob,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.calendar_month,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        onPressed: () {
                                          _showDatePicker();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 1.0, left: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        Dob,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.calendar_month,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        onPressed: () {
                                          _showDatePicker();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        //method for the hotel card
                        hoteldisp(
                            DonarName: DonarName,
                            Dob: Dob,
                            Donaraddress: Donaraddress,
                            Donarcontact: Donarcontact,
                            Fooditems: Fooditems,
                            ExpiryDate: ExpiryDate);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HomeMain())); //HERE HAS TO ADD THE FUNCTION THAT CONVERTS THE INPUT INTO THE DATAT CARD
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
                        minimumSize: const Size(70, 40),
                        disabledForegroundColor:
                            const Color.fromARGB(255, 40, 39, 39)
                                .withOpacity(0.38),
                        disabledBackgroundColor:
                            const Color.fromARGB(255, 44, 44, 44)
                                .withOpacity(0.12),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
