import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/widgets/active_tabs.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/widgets/quick_actions.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/widgets/todays_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.getHeight(73),
          child: Row(
            children: [
              SizedBox(
                width: SizeConfig.getWidth(20),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.getHeight(10)),
                child: CircleAvatar(
                  radius: SizeConfig.getWidth(25),
                  child: Icon(
                    Icons.person,
                    size: SizeConfig.getWidth(28),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.getWidth(12),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome back,",
                    style: GoogleFonts.inter(
                        fontSize: SizeConfig.getFont(12), color: Colors.grey),
                  ),
                  Text(
                    "Rajesh Kumar",
                    style: GoogleFonts.inter(
                        fontSize: SizeConfig.getFont(14),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.getWidth(20)),
                child: Image.asset(
                  "assets/Icons/notification.png",
                  height: SizeConfig.getHeight(24),
                  width: SizeConfig.getWidth(24),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: SizeConfig.getHeight(80),
          margin: EdgeInsets.symmetric(
              vertical: SizeConfig.getHeight(20),
              horizontal: SizeConfig.getWidth(20)),
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(SizeConfig.getFont(8))),
          child: Row(
            children: [
              SizedBox(
                width: SizeConfig.getWidth(16),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Current Plan",
                    style: GoogleFonts.inter(
                        fontSize: SizeConfig.getFont(12), color: Colors.grey),
                  ),
                  Text(
                    "Pro Monthly",
                    style: GoogleFonts.inter(
                        fontSize: SizeConfig.getFont(14),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                  height: SizeConfig.getHeight(30),
                  width: SizeConfig.getWidth(94),
                  margin: EdgeInsets.only(),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(220, 252, 231, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: SizeConfig.getFont(
                            14), // Matches the 14x14 dimension in the design
                        color: const Color(0xFF166534), // Deep green color
                      ),
                      SizedBox(
                        width: SizeConfig.getWidth(6),
                      ),
                      Text("Active",
                          style: GoogleFonts.inter(
                              color: const Color(
                                0xFF166534,
                              ),
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.getFont(14))),
                    ]),
                  )),
              SizedBox(
                width: SizeConfig.getWidth(10),
              ),

              
            ],
          ),
        ),
        

      ],
    );
  }
}
