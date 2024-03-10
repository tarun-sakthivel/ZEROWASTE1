import 'package:flutter/material.dart';

class Kilo extends StatefulWidget {
  const Kilo({super.key});

  @override
  State<Kilo> createState() => _KiloState();
}

class _KiloState extends State<Kilo> {
  double kilo = 1.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                if (kilo > 0) {
                  kilo = kilo - 0.5;
                  print(kilo);
                } else if (kilo == 0) {
                  kilo = 0;
                }
              });
            },
            child: const Icon(Icons.remove_circle_rounded, size: 20),
          ),
          const SizedBox(width: 5),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "$kilo Kgs",
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                kilo = kilo + 0.5;
                print(kilo);
              });
            },
            child: const Icon(Icons.add_circle_rounded, size: 20),
          )
        ],
      ),
    );
  }
}
