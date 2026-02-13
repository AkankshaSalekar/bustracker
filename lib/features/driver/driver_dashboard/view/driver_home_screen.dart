import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/widgets/active_tabs.dart';
import 'package:bus_tracker/widgets/driver_shell.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/widgets/earning.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/widgets/quick_actions.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/widgets/todays_route.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/widgets/top_bar.dart';
import 'package:bus_tracker/widgets/app_bottom_nav.dart';
import 'package:flutter/material.dart';

class DriverHomeScreen extends StatefulWidget{
  
  const DriverHomeScreen({super.key});

  State<DriverHomeScreen> createState()=>_DriverHomeScreenState();

}

class _DriverHomeScreenState extends State<DriverHomeScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              Container(
                // height: SizeConfig.getHeight(127),
                margin: EdgeInsets.all(SizeConfig.getWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActiveTabs(
                      iconColor: Color(0xFF0288D1), 
                      backgroundColor: Colors.lightBlue.shade50, 
                      icon: Icons.people, 
                      iconSize:20, 
                      countString: "24", 
                      bottomString: "Total Students"
                    ),
                    const ActiveTabs(
                      iconColor: Colors.green, 
                      backgroundColor: Color.fromRGBO(220, 252, 231, 1), 
                      icon: Icons.location_on_outlined, 
                      iconSize:20, 
                      countString: "3", 
                      bottomString: "Active Routes"
                    ),
                    
                  ],
                ),
              ),
              const TodaysRoute(),
              const QuickActions(),
              const EarningSection()
            ],
          ),
        )
      ),
    );
  }
}