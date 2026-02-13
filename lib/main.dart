import 'package:bus_tracker/features/driver/add_student/bloc/address_bloc/student_bloc.dart';
import 'package:bus_tracker/features/driver/add_student/view/add_students.dart';
import 'package:bus_tracker/features/driver/driver_dashboard/view/driver_home_screen.dart';
import 'package:bus_tracker/features/splash/view/splashscreen.dart';
import 'package:bus_tracker/widgets/driver_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: DriverShell()
        body: BlocProvider<StudentBloc>(
          create: (context) => StudentBloc(),
          child: const AddStudents()
        )
      ),
    );
  }
}
