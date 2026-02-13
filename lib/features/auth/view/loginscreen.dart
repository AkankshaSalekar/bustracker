import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:bus_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:bus_tracker/features/auth/bloc/auth_state.dart';
import 'package:bus_tracker/features/auth/widgets/driver_login_form.dart';
import 'package:bus_tracker/features/auth/widgets/parent_login_form.dart';
import 'package:bus_tracker/features/auth/widgets/role_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocProvider(
      create: (_) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(20)),
          child: Column(
            children: [
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                return state.isDriver
                    ? Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.getHeight(80),
                          ),
                          Center(
                              child: Image.asset(
                            "assets/Login/login_img.png",
                            width: SizeConfig.getWidth(100),
                            height: SizeConfig.getHeight(100),
                          )),
                          SizedBox(
                            height: SizeConfig.getHeight(0),
                          ),
                          Text(
                            "Driver Login",
                            style: TextStyle(
                                fontSize: SizeConfig.getFont(24),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.getHeight(20),
                          ),
                          Text(
                            "Manage your route, students & earnings",
                            style: TextStyle(
                                fontSize: SizeConfig.getFont(15),
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: SizeConfig.getHeight(20),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.getHeight(80),
                          ),
                          Center(
                              child: Image.asset(
                            "assets/Login/parent_login_img.png",
                            width: SizeConfig.getWidth(100),
                            height: SizeConfig.getHeight(100),
                          )),
                          SizedBox(
                            height: SizeConfig.getHeight(0),
                          ),
                          Text(
                            "Parent Login",
                            style: TextStyle(
                                fontSize: SizeConfig.getFont(24),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.getHeight(20),
                          ),
                          Text(
                            "Track your child’s safe journey to school",
                            style: TextStyle(
                                fontSize: SizeConfig.getFont(15),
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: SizeConfig.getHeight(20),
                          ),
                        ],
                      );
              }),

              //Role TOggle
              RoleToggle(),

              SizedBox(
                height: SizeConfig.getHeight(30),
              ),

              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                return state.isDriver ? DriverLoginForm() : ParentLoginForm();
              }),
              BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                if (state.isDriver) {
                  return Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.getHeight(30),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.getWidth(0)),
                      child: Text(
                        "Use the mobile number provided to you from \n Admin for Login.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeConfig.getFont(12),
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF6B7280),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                );
                }
                return Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.getHeight(30),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.getWidth(0)),
                      child: Text(
                        "Use the mobile number provided to your van \n driver for Login.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeConfig.getFont(12),
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF6B7280),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
        )),
      ),
    );
  }
}
