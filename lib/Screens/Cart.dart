import 'package:flutter/material.dart';
import 'package:zerowaste111/Components/bottom_navigation_bar.dart';
import 'package:zerowaste111/Components/kilo.dart';
import 'package:zerowaste111/Screens/detailspage.dart';

class ShoppingCartScreen extends StatefulWidget {
  List<String> cartItems = [];
  ShoppingCartScreen({required this.cartItems, super.key});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<String> cartItems = [];
  int noorder = 3;
  int preptime = 1;
  @override
  void initState() {
    setState(() {
      int noorder = 7;
      cartItems = widget.cartItems;
    });

    int noorder = 3;
    int preptime = 1;
    // TODO: implement initState
    super.initState();
  }

  void addToCart(String item) {
    setState(() {
      int noorder = cartItems.length;
      preptime = preptime * 2;
      cartItems.add(item);
    });
  }

  void removeFromCart(String item) {
    setState(() {
      preptime = 2 * preptime - preptime;
      cartItems.remove(item);
      noorder = noorder - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttomnavigator(index1: index1),
      backgroundColor: const Color.fromRGBO(244, 239, 233, 1),
      body: Column(
        children: [
          const Text('Shopping Cart'),
          const Image(image: AssetImage("assets/Images/divider.png")),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 90,
                    width: 350,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Image(
                            image: AssetImage("assets/Images/burger.png")),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Text(cartItems[index]),
                                ),
                                const SizedBox(
                                  width: 83,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    removeFromCart(cartItems[index]);
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Expiry Date:",
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                for (int j = 0; j < 10; j++)
                                  Text(
                                    Dob[j],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                const Kilo()
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Divider(
                  indent: 16,
                  endIndent: 16,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Total Quantity",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 20),
                          child: Text(
                            "Packing Time",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "$noorder",
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                          child: Text(
                            "$preptime" "\tmins",
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          setState(() {
                            noorder = noorder + 1;
                          });
                          // Show a dialog or navigate to a product selection screen
                          // where the user can choose items to add to the cart.
                          addToCart("Product XYZ");
                        },
                        child: const Text("Add to cart")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 52, 52, 52)),
                        onPressed: () {
                          _showBottomAlertDialog(context);
                          // Show a dialog or navigate to a product selection screen
                          // where the user can choose items to add to the cart.
                        },
                        child: const Text("Place Order")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showBottomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          child: AlertDialog(
            elevation: 40,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            buttonPadding: const EdgeInsets.all(5),
            backgroundColor: Colors.black.withOpacity(0.6),
            alignment: Alignment.bottomCenter,
            title: const Text(
              'Your oder is placed',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 205, 23)),
            ),
          ),
        ),
      );
    },
  );
}
