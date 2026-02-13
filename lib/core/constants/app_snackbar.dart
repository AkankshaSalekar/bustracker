import 'package:bus_tracker/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static void show(
    BuildContext context,{
    required String message,
    Color backgroundColor = AppColors.info,
    Duration duration=const Duration(seconds: 2),
    }
  ){
    ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      )
    );
  }

  static void success(BuildContext context,String message){
    show(
      context, 
      message: message,
      backgroundColor: AppColors.success
    );
  }

  static void error(BuildContext context,String message){
    show(
      context,
      message: message,
      backgroundColor: AppColors.error,
    );
  }

  static void info(BuildContext context,String message){
    show(
      context, 
      message: message,
      backgroundColor: AppColors.info
    );
  }
}