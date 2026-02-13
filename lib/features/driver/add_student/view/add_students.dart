import 'dart:math';

import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:bus_tracker/features/driver/add_student/bloc/address_bloc/student_bloc.dart';
import 'package:bus_tracker/features/driver/add_student/bloc/address_bloc/student_event.dart';
import 'package:bus_tracker/features/driver/add_student/bloc/address_bloc/student_state.dart';
import 'package:bus_tracker/features/driver/add_student/view/mappickerscreen.dart';
import 'package:bus_tracker/features/driver/add_student/widgets/mapholder.dart';
import 'package:bus_tracker/features/driver/add_student/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({super.key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  final studentNameController = TextEditingController();
  final parentNameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final feesController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEBF7F4),
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.white,
          title: Text(
            "Add New Student",
            style: GoogleFonts.inter(
                fontSize: SizeConfig.getFont(18),
                fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getWidth(20),
                vertical: SizeConfig.getHeight(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      size: SizeConfig.getFont(22),
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Student Details",
                      style: GoogleFonts.inter(
                          fontSize: SizeConfig.getFont(18),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.getHeight(16),
                ),
                CustomTextField(
                  title: 'Student Name',
                  hintText: 'e.g Aarav Sharma',
                  textController: studentNameController,
                ),
                SizedBox(
                  height: SizeConfig.getHeight(20),
                ),
                CustomTextField(
                  title: 'Parent Name',
                  hintText: 'e.g Rajesh Sharma',
                  textController: parentNameController,
                ),
                SizedBox(
                  height: SizeConfig.getHeight(20),
                ),
                CustomTextField(
                  title: 'Parent Mobile Number',
                  hintText: 'e.g 9876543210',
                  prefixIcon: Icons.phone_outlined,
                  textController: mobileNoController,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: SizeConfig.getHeight(20),
                ),
                BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if (state.isManual) {
                      return CustomTextField(
                        title: "Manual Address",
                        hintText: "Enter Address here...",
                        textController: addressController,
                        onChanged: (val) => context
                            .read<StudentBloc>()
                            .add(AddressChanged(val)),
                      );
                    } else {
                      return MapPlaceHolder(
                        address: state.address,
                        onTap: () => _handleMapNavigation(context),
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    Icon(
                      Icons.currency_rupee_sharp,
                      size: SizeConfig.getFont(22),
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Fees Details",
                      style: GoogleFonts.inter(
                          fontSize: SizeConfig.getFont(18),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.getHeight(20),
                ),
                CustomTextField(
                  title: 'Monthly Fees',
                  hintText: 'e.g 1500',
                  prefixIcon: Icons.currency_rupee,
                  textController: feesController,
                  inputType: TextInputType.number,
                ),
              ],
            ),
          )),
        ));
  }

  Future<void> _handleMapNavigation(BuildContext context) async {
    final String? pickedAddress = await Navigator.push<String>(context,
        MaterialPageRoute(builder: (context) => const MapPickerScreen()));

    if (pickedAddress != null && context.mounted) {
      context.read<StudentBloc>().add(AddressChanged(pickedAddress));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if(mounted){
          addressController.text = pickedAddress;
        }
      });
    }
  }
}
