import 'package:flutter/material.dart';
import 'package:kala_rethink/views/AddPost/AddPost.dart';
import 'package:kala_rethink/widgets/text_fields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              image: AssetImage('assets/images/5.jpg'), // Replace with your actual image path
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
          Positioned(
              top: 175,
              left: MediaQuery.of(context).size.width / 2 - 100,
              child: Text(
                'Sign Up',
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
                    'Sign Up',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color:Color(0xFF890608) ),
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
