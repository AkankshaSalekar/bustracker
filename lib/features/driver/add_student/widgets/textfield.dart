import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController textController;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;


  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.textController,
    this.prefixIcon,
    this.inputType,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: GoogleFonts.inter(fontSize: SizeConfig.getFont(14),fontWeight: FontWeight.w400,color: Colors.grey)),
        SizedBox(height: SizeConfig.getHeight(8),),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8)
          ),
          child: TextField(
            controller:textController,
            keyboardType: inputType ?? TextInputType.number,
            onChanged: onChanged,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: GoogleFonts.inter(fontSize: SizeConfig.getFont(15),fontWeight: FontWeight.w500,color: const Color(0xFF9E9E9E),letterSpacing: 0.2),
              prefixIcon: prefixIcon!=null?Icon(prefixIcon,size: SizeConfig.getFont(18),color: Colors.grey,):null,
              
              border:OutlineInputBorder(
              
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              )
            ),

          ),
        )
      ],
    );
  }
}