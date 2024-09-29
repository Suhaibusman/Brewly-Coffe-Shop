import 'dart:ui'; // Required for BackdropFilter
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {

  const CallScreen({super.key, });

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/profile Image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Blur effect on the background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0.3), // Slight transparent overlay
            ),
          ),

          // Overlay content
          SafeArea(
            child: Column(
              children: [
                // Timer (Top-Right)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.fiber_manual_record,
                              color: Colors.red, size: 14),
                          const SizedBox(width: 5),
                          Text(
                            "19 : 00 Minute",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),

                // Doctor Image and Name
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/profile Image.png"),
                    ),
                    const SizedBox(height: 16),
                    Text(
                  "Brooklyn Simmons",
                      style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      )),
                  ],
                ),

                const Spacer(),

                // Audio recording text
                Text(
                  "Audio Recording is Active",
                  style : TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,)
                ),
                const SizedBox(height: 30),

                // Call End Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.volume_up, color: Colors.white),
                      iconSize: 40,
                      onPressed: () {
                        // Mute Button Action
                      },
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.call_end, color: Colors.white),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.mic, color: Colors.white),
                      iconSize: 40,
                      onPressed: () {
                        // Mute Microphone Action
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
