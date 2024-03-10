import 'package:flutter/material.dart';
import 'package:zerowaste111/Screens/detailspage.dart';
import 'package:zerowaste111/Screens/hoteldisp.dart';

class donardisp extends StatefulWidget {
  const donardisp({super.key});

  @override
  State<donardisp> createState() => _donardispState();
}

class _donardispState extends State<donardisp> {
//ALL THE VARIABLE TO BE DEFINED HERER
  String img = "assets/Images/A2B.png";
  String Username = "";
  String donarname = "Adayar Anandha \nBhavan";
  int quantity = 5;
  final String _date = "12.03.2023";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 290,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  width: 320,
                  height: 290,
                  child: Image(
                    image: AssetImage(img),
                    fit: BoxFit.fill,
                  ),
                )),
            Expanded(
              flex: 2,
              child: Container(
                height: 200,
                width: 320,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        DonarName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0, right: 32),
                      child: Row(
                        children: [
                          const Text(
                            "Quantity Available:",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$quantity" "Kgs",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 2, right: 0, bottom: 2),
                      child: Row(
                        children: [
                          const Text(
                            "Expiry Date:",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            _date,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Container(
                              height: 30,
                              width: 100,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shadowColor: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => hoteldisp(
                                                DonarName: DonarName,
                                                Dob: Dob,
                                                Donaraddress: Donaraddress,
                                                Donarcontact: Donarcontact,
                                                Fooditems: Fooditems,
                                                ExpiryDate: ExpiryDate)));
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "More",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Icon(
                                        Icons.navigate_next,
                                        size: 20,
                                      ),
                                    ],
                                  )))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
