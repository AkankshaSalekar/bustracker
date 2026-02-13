import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveTabs extends StatelessWidget {
  final Color iconColor;
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;
  final String countString;
  final String bottomString;
  const ActiveTabs({super.key, required this.iconColor, required this.backgroundColor, required this.icon, required this.iconSize, required this.countString, required this.bottomString});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getHeight(133),
      width: SizeConfig.getWidth(162),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getWidth(16),
          vertical: SizeConfig.getWidth(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(SizeConfig.getFont(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.getHeight(36),
            width: SizeConfig.getWidth(36),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: SizeConfig.getFont(iconSize),
            ),
          ),
          SizedBox(
            height: SizeConfig.getHeight(12),
          ),
          Text(
            countString,
            style: GoogleFonts.inter(
              fontSize: SizeConfig.getFont(24),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            bottomString,
            style: GoogleFonts.inter(
                fontSize: SizeConfig.getFont(12), color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
