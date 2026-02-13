import 'package:bus_tracker/core/constants/app_colors.dart';
import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodaysRoute extends StatelessWidget {
  const TodaysRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getHeight(200),
      // width: SizeConfig.getWidth(162),
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.getWidth(20),
          vertical: SizeConfig.getWidth(16)),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getWidth(16),
          vertical: SizeConfig.getWidth(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(SizeConfig.getFont(10)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Morning Route",
                style: GoogleFonts.inter(
                    fontSize: SizeConfig.getFont(16),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "7.00 AM",
                style: GoogleFonts.inter(
                    fontSize: SizeConfig.getFont(12), color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.getHeight(16),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: SizeConfig.getHeight(10),
                width: SizeConfig.getWidth(10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
              ),
              SizedBox(
                width: SizeConfig.getWidth(6),
              ),
              Text(
                "Sector 14,Main Road",
                style: GoogleFonts.inter(
                  fontSize: SizeConfig.getFont(16),
                ),
              ),
              Spacer(),
              Text(
                "Picked",
                style: GoogleFonts.inter(
                    fontSize: SizeConfig.getFont(12), color: Colors.green),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 4), // Centers line under dots
                width: 2,
                height:SizeConfig.getHeight(24), // Adjust this to change vertical spacing
                color: const Color(0xFFE5E7EB), // Light grey line
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: SizeConfig.getHeight(10),
                width: SizeConfig.getWidth(10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              ),
              SizedBox(
                width: SizeConfig.getWidth(6),
              ),
              Text(
                "St. Xavier's School",
                style: GoogleFonts.inter(
                  fontSize: SizeConfig.getFont(16),
                ),
              ),
              Spacer(),
              Text(
                "Drop Pending",
                style: GoogleFonts.inter(
                    fontSize: SizeConfig.getFont(12), color: Colors.grey),
              )
            ],
          ),
          Container(
            height: SizeConfig.getHeight(46),
            margin: EdgeInsets.only(top: SizeConfig.getHeight(10),left: SizeConfig.getWidth(10),right: SizeConfig.getWidth(10)),
            decoration: BoxDecoration(
              color: AppColors.info,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.near_me_outlined,size: SizeConfig.getFont(18),color: Colors.white,),
                const SizedBox(width: 2,),
                Text("Start Live Trip",style: GoogleFonts.dmSans(fontSize: SizeConfig.getFont(16),fontWeight: FontWeight.bold,color: Colors.white),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
