import 'package:bus_tracker/core/constants/app_snackbar.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/view/driver_home_screen.dart';
import 'package:bus_tracker/widgets/app_bottom_nav.dart';
import 'package:flutter/material.dart';

class DriverShell extends StatefulWidget{
    const DriverShell({super.key});

    State<DriverShell> createState()=>_DriverShellState();
}
class _DriverShellState extends State<DriverShell>{

    int _index=0;
    DateTime? _lastBackPress;

    final screens=const[
        DriverHomeScreen(),
        // TripsScreen(),
        // StudentsScreen(),
        // ProfileScreen(),
    ];

    @override
    Widget build(BuildContext context){
        return WillPopScope(
          onWillPop:_onBackPressed,
          child: Scaffold(
              body:IndexedStack(
                  index: _index,
                  children: screens,
              ),
              bottomNavigationBar: AppBottomNav(
                  currentIndex: _index, 
                  onTap: (i)=>setState(()=>_index=i)
              ),
          ),
        );
    }

    Future<bool> _onBackPressed()async{
      if(_index!=0){
        setState(() =>_index=0);
        return false;
      }
      final now=DateTime.now();
      if(_lastBackPress==null ||now.difference(_lastBackPress!)>const Duration(seconds: 2)){
        _lastBackPress=now;
        AppSnackbar.info(context, "Press Back Again to exit");
        return false;
      }
      return true;
      
    }
}