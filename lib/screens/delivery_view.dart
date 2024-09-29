import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/screens/call_screen.dart';
import 'package:flutter/material.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Main content
      body: Stack(
        children: [
          // Background image (Map image)
          Image.asset(
            "assets/images/map.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          // Draggable BottomSheet within the Stack
          DraggableScrollableSheet(
            initialChildSize:
                0.3, // Initial height of the sheet (30% of screen)
            minChildSize: 0.1, // Minimum height of the sheet
            maxChildSize: 0.5, // Maximum height of the sheet (50% of screen)
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16), // Rounded top corners
                  ),
                ),
                child: ListView(
                  controller:
                      scrollController, // Ensures the sheet is scrollable
                  children: [
                    Image.asset("assets/images/Indicator.png"),
                    const Center(
                      child: Text(
                        "10 minutes left",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Delivery to ",
                          style: TextStyle(
                            color: CustomColors().lighter,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          "Jl. Kpg Sutoyo",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset("assets/images/green_bars.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: CustomColors().grey1)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset("assets/images/Deliver.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Delivered your order",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: CustomColors().dark),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                overflow: TextOverflow.clip,
                                "We will deliver your \n goods to you in the \n shortes possible time.",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors
                                      .grey, // Replace with your custom color
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Profile.png"),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Brooklyn Simmons",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: CustomColors().dark,
                              ),
                            ),
                            const Text(
                              "Personal Courier",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CallScreen(),));                          },
                          child: Image.asset(
                            "assets/images/Call.png",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
