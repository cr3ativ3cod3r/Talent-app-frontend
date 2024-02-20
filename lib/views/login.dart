import 'package:flutter/material.dart';
import 'package:kala_rethink/views/AddPost/AddPost.dart';
import 'package:kala_rethink/views/signup.dart';
import 'package:kala_rethink/widgets/text_fields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [ Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/signback.jpg'), // Replace with your actual image path
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
          Positioned(
            top: 175,
              left: MediaQuery.of(context).size.width / 2 - 75,
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Color(0xFFF1AD0E),
                ),
              )),
          Positioned(
            top: 285,
            left: MediaQuery.of(context).size.width / 2 - 120,
              child: SizedBox(
                width: 250,
                child: reusableTextField(
                  "Username",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
              ),),
          Positioned(
            top: 370,
            left: MediaQuery.of(context).size.width / 2 - 120,
            child: SizedBox(
              width:250,
              child: reusableTextField(
              "Password",
              Icons.person_outline,
              true,
              _passwordTextController,
                        ),
            ),),
          Positioned(
            top: 465,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPost()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary:Color(0xFFF1AD0E),
                      elevation: 20,
                      shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Set the radius you want here
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color:Color(0xFF890608) ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 535,
              left: MediaQuery.of(context).size.width / 2 - 105,
              child: Text(
                'New to the app?',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  color: Color(0xFFF1AD0E),
                ),
              )),
          Positioned(
            top: 535,
            left: MediaQuery.of(context).size.width / 1 - 145,
            child: GestureDetector(
              onTap: () {
                // Navigate to the SignUpPage when "Sign Up" is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFFF1AD0E),
                ),
              ),
            ),
          ),


    ],
      ),
    );
  }
}
