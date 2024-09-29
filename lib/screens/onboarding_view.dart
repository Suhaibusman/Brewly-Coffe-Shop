import 'package:brewly/components/bottom_navbar.dart';
import 'package:brewly/components/button.dart';
import 'package:brewly/screens/auth_screens/login_screen/login_screen.dart';
import 'package:brewly/screens/home_view.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Gradient container at the bottom, always visible
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff050505), // Start color (top)
                    Color(0xff1C1C1C), // End color (bottom)
                  ],
                ),
              ),
            ),
          ),

          // Conditionally displaying the image
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/images/Image_Onboarding.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              fit: BoxFit.cover,
            ),
          ),

          // Text that overlays half on the image and half on the gradient
          Positioned(
            top: MediaQuery.of(context).size.height * 0.50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Fall in Love with Coffee in Blissful Delight!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: const Text(
                    textAlign: TextAlign.center,
                    "Welcome to our cozy coffee corner, where every cup is a delightful for you.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Color(0xffA2A2A2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  buttonText: "Get Started",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
