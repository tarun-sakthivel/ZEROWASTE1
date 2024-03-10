import 'package:zerowaste111/Components/Firebse_auth.dart';
import 'package:zerowaste111/Screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zerowaste111/Components/FormContainerWidget.dart';
import 'package:zerowaste111/Components/frostglass.dart';
import 'package:zerowaste111/Screens/signup.dart';
//import 'package:dumm;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool _SigningIn = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/login_page.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FrostedGlassBox(
            theWidth: 350.0,
            theHeight: 400.0,
            theChild: Logindetails(context),
          ),
        ),
      ),
    );
  }

  Widget Logindetails(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          //SizedBox(height: 20),
          const Text(
            'USER LOGIN',
            style: TextStyle(
              color: Color(0xFF4E4848),
              fontSize: 32,
              fontFamily: 'Georgia',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          FormContainerWidget(
            controller: _emailController,
            icon: const Icon(Icons.email_outlined),
            hintText: "Email",
            isPasswordField: false,
          ),
          const SizedBox(height: 25),
          FormContainerWidget(
            controller: _passwordController,
            icon: const Icon(Icons.lock_outline),
            hintText: "Password",
            isPasswordField: true,
          ),
          const SizedBox(height: 25),
          // Container(
          //   width: 300, // Set the width of the dropdown button
          //   child: DropdownButton(
          //     dropdownColor: Colors.greenAccent,
          //     icon: Icon(Icons.arrow_drop_down),
          //     hint: Text("Choose your category:"),
          //     value: valueChoose,
          //     onChanged: (newValue) {
          //       setState(() {
          //         valueChoose = newValue as String?;
          //       });
          //     },
          //     items: listItem.map((valueItem) {
          //       return DropdownMenuItem(
          //         value: valueItem,
          //         child: Text(valueItem),
          //       );
          //     }).toList(),
          //   ),
          // ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () => _signIn(),
            child: Container(
              height: 55,
              width: 310,
              decoration: BoxDecoration(
                  color: const Color(0x66000000),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: _SigningIn
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const signup()));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(221, 13, 103, 229)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _SigningIn = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.loginEandP(email, password);
    setState(() {
      _SigningIn = false;
    });
    if (user != null) {
      //showToast(message: "User successfully Loged in");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      //showToast(message: "Login unsuccessful");
    }
  }
}


//Login Page