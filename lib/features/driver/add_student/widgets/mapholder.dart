import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPlaceHolder extends StatelessWidget {
  final String address;
  final VoidCallback onTap;

  const MapPlaceHolder({
    super.key,
    required this.address,
    required this.onTap
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.getHeight(150),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFDDEEEA),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on,color: Colors.redAccent,size: SizeConfig.getFont(32),),
            SizedBox(height: SizeConfig.getHeight(10),),
            Container(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeight(8),horizontal: SizeConfig.getWidth(16)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              ),
              child: Text(
                address.isEmpty?"Tap to set location":address,
                textAlign: TextAlign.center,
                style:GoogleFonts.inter(
                  fontSize: SizeConfig.getFont(12),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A324B)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}