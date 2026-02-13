import 'package:flutter/material.dart';

class SizeConfig{
  //Figma design size
  static double figmaWidth=375;
  static double figmaHeight=835;

  static late double screenWidth;
  static late double screenHeight;

  static late double widthScale=1.0;
  static late double heightScale=1.0;

  static bool isInitialized=false;

  /// Call this in every screen's build method
  static void init(BuildContext context){
    if(isInitialized) return;
    
    final size=MediaQuery.of(context).size;

    screenWidth=size.width;
    screenHeight=size.height;

    widthScale-screenWidth/figmaWidth;
    heightScale-screenHeight/figmaHeight;
    isInitialized=true;
  }

  //Width getter 
  static double getWidth(double width)=> width*widthScale;
  

  //height Getter
  static double getHeight(double height)=>height*heightScale;
  

  //FontSize Getter 
  static double getFont(double fontSize)=>fontSize*(widthScale+heightScale)/2;
  
}