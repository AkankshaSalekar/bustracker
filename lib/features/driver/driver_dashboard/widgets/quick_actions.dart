import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(16),horizontal: SizeConfig.getWidth(20)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Quick Actions",style: GoogleFonts.inter(fontSize: SizeConfig.getFont(16),fontWeight: FontWeight.bold),),
          SizedBox(height: SizeConfig.getHeight(15),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){},
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.getHeight(56),
                      width: SizeConfig.getWidth(56),
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(220, 252, 231, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.add_circle_outline,size: SizeConfig.getFont(24),color: Colors.green,),
                    ),
                    SizedBox(height: SizeConfig.getHeight(10),),
                    Text("Add \nStudents" , style: GoogleFonts.inter(fontSize: SizeConfig.getFont(12),fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.getHeight(56),
                      width: SizeConfig.getWidth(56),
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(220, 252, 231, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.map_outlined,size: SizeConfig.getFont(24),color: Colors.green,),
                    ),
                    SizedBox(height: SizeConfig.getHeight(10),),
                    Text("Create \nRoute" , style: GoogleFonts.inter(fontSize: SizeConfig.getFont(12),fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.getHeight(56),
                      width: SizeConfig.getWidth(56),
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(220, 252, 231, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.description_outlined,size: SizeConfig.getFont(24),color: Colors.green,),
                    ),
                    SizedBox(height: SizeConfig.getHeight(10),),
                    Text("View \nReports" , style: GoogleFonts.inter(fontSize: SizeConfig.getFont(12),fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}