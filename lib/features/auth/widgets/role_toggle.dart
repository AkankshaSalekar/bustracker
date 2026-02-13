import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:bus_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:bus_tracker/features/auth/bloc/auth_event.dart';
import 'package:bus_tracker/features/auth/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleToggle extends StatelessWidget{
  const RoleToggle({super.key});

  @override
  Widget build(BuildContext context){
    SizeConfig.init(context);
    return BlocBuilder<AuthBloc,AuthState>(
      builder: (context,state){
        return Container(
          width: SizeConfig.getWidth(327),
          height: SizeConfig.getHeight(56),
          decoration: BoxDecoration(
            color: state.isDriver ? const Color(0xFFE6F0FF) : const Color(0xFFE6F4F1),
            borderRadius: BorderRadius.circular(SizeConfig.getWidth(30)),
          ),
            child:Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 250),
                  alignment: state.isDriver
                  ?Alignment.centerLeft
                  :Alignment.centerRight,
                  child: Container(
                    width: SizeConfig.getWidth(160),
                    decoration: BoxDecoration(
                      color: state.isDriver? Color(0xFF0B74FF):Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(SizeConfig.getWidth(25))
                    ),
                  ),
                ),
                Row(
                  children: [
                    _tab(context,"Driver",true,state.isDriver),
                    _tab(context,"Parent",false,!state.isDriver),
                  ],
                )
              ],
            ),
        );
      }
    );
    
  }

  Widget _tab(BuildContext context,String title,bool isDriver,bool isActive){
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          context.read<AuthBloc>().add(SelectRoleEvent("",isDriver: isDriver));
        },
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: isActive ? Colors.white : Colors.black54,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      )
    );
  }

}