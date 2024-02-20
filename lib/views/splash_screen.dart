import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kala_rethink/views/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    navigateToLoginPage();
  }

  void navigateToLoginPage() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => Login()),
        );
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Set status bar color to transparent
        statusBarIconBrightness: Brightness.dark, // Set status bar icons to dark
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true, // Set to true to extend behind the app bar
      appBar: AppBar(
        // Add your app bar settings here
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_screen.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: 210,
            left: MediaQuery.of(context).size.width / 2 - 65,
            child: Text(
              'kala',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 80,
                fontFamily: GoogleFonts.lobsterTwo().fontFamily,
                color: Color(0xFF630D0D),
              ),
            ),
          ),
          Positioned(
            top: 320,
            left: MediaQuery.of(context).size.width / 2 - 125,
            child: Text(
              'Where art meets opportunity',
              style: TextStyle(
                fontSize: 25,
                fontFamily: GoogleFonts.lobsterTwo().fontFamily,
                color: Color(0xFF630D0D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
