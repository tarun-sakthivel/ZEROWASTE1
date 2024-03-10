import 'package:zerowaste111/Components/Firebse_auth.dart';
import 'package:zerowaste111/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:zerowaste111/Components/FormContainerWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:zerowaste11/Components/frosterglass.dart';
import 'package:zerowaste111/Components/frostglass.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool _SigningUp = false;
  final TextEditingController _usenameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usenameController.dispose();
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
              fit: BoxFit.cover),
        ),
        child: Center(
          child: FrostedGlassBox(
            theWidth: 350.0,
            theHeight: 400.0,
            theChild: _SignUpdetails(context),
          ),
        ),
      ),
    );
  }

  Widget _SignUpdetails(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            'USER SIGNUP',
            style: TextStyle(
              color: Color(0xFF4E4848),
              fontSize: 32,
              fontFamily: 'Georgia',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 25),
          FormContainerWidget(
            icon: const Icon(Icons.account_circle_outlined),
            controller: _usenameController,
            hintText: "UserName",
            isPasswordField: false,
          ),
          const SizedBox(height: 20),
          FormContainerWidget(
            icon: const Icon(Icons.email_outlined),
            controller: _emailController,
            hintText: "Email",
            isPasswordField: false,
          ),
          const SizedBox(height: 20),
          FormContainerWidget(
            icon: const Icon(Icons.lock_outline),
            controller: _passwordController,
            hintText: "Password",
            isPasswordField: true,
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              _signUp();
            },
            child: Container(
              height: 55,
              width: 310,
              decoration: BoxDecoration(
                  color: const Color(0x66000000),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: _SigningUp
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "SIGN UP",
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
                "Already have an account?  ",
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
              // SizedBox(width: 2),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(221, 13, 103, 229)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _SigningUp = true;
    });
    String username = _usenameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signupEandP(email, password, username);
    setState(() {
      _SigningUp = false;
    });
    if (user != null) {
      //showToast(message: "User successfully created");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      //showToast(message: "SignUp unsuccessful");
    }
  }
}

//Signup Page