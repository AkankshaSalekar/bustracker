import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningSection extends StatelessWidget {
  const EarningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getHeight(120),
      width: SizeConfig.getWidth(335),
      // width: SizeConfig.getWidth(162),
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.getWidth(20),
          vertical: SizeConfig.getWidth(16)),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getWidth(16),
          vertical: SizeConfig.getWidth(10)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(SizeConfig.getFont(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("This Month's Earnings",style: GoogleFonts.inter(fontSize: SizeConfig.getFont(16),color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("24,500",style: GoogleFonts.inter(fontSize: SizeConfig.getFont(24),fontWeight: FontWeight.bold)),
              Container(
                height: SizeConfig.getHeight(32),
                width: SizeConfig.getWidth(32),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.arrow_forward_ios_outlined,size: SizeConfig.getFont(16),)
              )
              
            ],
          ),
          SizedBox(height: SizeConfig.getHeight(4)),
          ClipRRect(
            borderRadius: BorderRadius.circular(SizeConfig.getHeight(10)),
            child: SizedBox(
              height: SizeConfig.getHeight(6),
              child: LinearProgressIndicator(
                value: 0.75,
                backgroundColor: Color(0xFFF3F4F6),
                valueColor:AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(4)),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Target : ₹30,000",
                style: GoogleFonts.inter(
                  fontSize: SizeConfig.getFont(16),
                ),
              ),
              Spacer(),
              Text(
                "75% Achieved ",
                style: GoogleFonts.inter(
                    fontSize: SizeConfig.getFont(12), color: Colors.green),
              )
            ],
          ),
        ]
      )
    );
  }
}