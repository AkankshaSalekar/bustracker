import 'package:bus_tracker/core/constants/app_colors.dart';
import 'package:bus_tracker/core/constants/app_snackbar.dart';
import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:bus_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:bus_tracker/features/auth/bloc/auth_event.dart';
import 'package:bus_tracker/features/auth/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ParentLoginForm extends StatefulWidget {
  const ParentLoginForm({super.key});

  @override
  State<ParentLoginForm> createState() => _ParentLoginFormState();
}

class _ParentLoginFormState extends State<ParentLoginForm> {
  final mobilectrl = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          AppSnackbar.error(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: SizeConfig.getHeight(52),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(SizeConfig.getWidth(10)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.getWidth(12)),
                    child: const Icon(
                      Icons.phone_android_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "+91",
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                  const VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: mobilectrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          hintText: " Enter 10 Digit mobile number",
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.getHeight(20),
            ),
            Container(
              height: SizeConfig.getHeight(52),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.getHeight(10))),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.getHeight(10))),
                    )),
              ),
            ),
            SizedBox(
              height: SizeConfig.getHeight(20),
            ),
            Center(
              child: GestureDetector(
                  onTap: state.isLoading
                      ? null
                      : () {
                          context.read<AuthBloc>().add(DriverLoginEvent(
                              mobile: mobilectrl.text.trim(),
                              password: password.text.trim()));
                        },
                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : Container(
                          alignment: Alignment.center,
                          height: SizeConfig.getHeight(56),
                          width: SizeConfig.getWidth(327),
                          decoration: BoxDecoration(
                              color: AppColors.parentColor,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.getWidth(10))),
                          child: Text(
                            "Login",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: SizeConfig.getFont(16)),
                          ),
                        )),
            )
          ],
        );
      },
    );
  }
}
