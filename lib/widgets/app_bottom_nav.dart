import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget{
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNav({super.key, required this.currentIndex, required this.onTap});

  Widget build(BuildContext context){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: (currentIndex==0)?Colors.black:Colors.grey,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.route,color: (currentIndex==1)?Colors.black:Colors.grey,),
          label: 'Trips',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people,color: (currentIndex==2)?Colors.black:Colors.grey,),
          label: 'Students',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,color: (currentIndex==3)?Colors.black:Colors.grey,),
          label: 'Profile',
        )
      ]
    );
  }
}