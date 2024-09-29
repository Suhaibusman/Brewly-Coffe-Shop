import 'package:flutter/material.dart';

class CoffeeFlavorCard extends StatelessWidget {
  final String flavorName;
  final bool isSelected;
  final Function()? onTap;
  final double? boxWidth;

  const CoffeeFlavorCard(
      {super.key,
      required this.flavorName,
      required this.isSelected,
      this.onTap,
      this.boxWidth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        height: 29,
        width: boxWidth,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xffC67C4E)
              : const Color(
                  0xffEDEDED), // Brown background color for coffee theme
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            flavorName,
            style: isSelected
                ? const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )
                : const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: Colors.black,
                  ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
