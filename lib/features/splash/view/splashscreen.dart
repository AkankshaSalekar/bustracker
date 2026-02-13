import 'package:bus_tracker/core/utils/sizeconfig.dart';
import 'package:bus_tracker/features/auth/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget{

  const Splashscreen({super.key});

  @override
  State createState()=> _Splashscreenstate();
}
class _Splashscreenstate extends State<Splashscreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _slideController;
  
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  

  @override
  void initState() {
    super.initState();
    // Fade animation for logo
    _fadeController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);
    
    // Scale animation for text
    _scaleController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
    
    // Slide animation for progress indicator
    _slideController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0, 2), end: Offset.zero).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );
    
    // Start animations
    _fadeController.forward();
    Future.delayed(Duration(milliseconds: 300), () => _scaleController.forward());
    Future.delayed(Duration(milliseconds: 600), () => _slideController.forward());
    
    // Navigate after delay
    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginscreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Fade animation for logo
          FadeTransition(
            opacity: _fadeAnimation,
            child: Center(
              child: Image.asset("assets/splash logo.png"),
            ),
          ),
          SizedBox(height: 20),
          // Scale animation for main title
          ScaleTransition(
            scale: _scaleAnimation,
            child: Text(
              "SafeRoute",
              style: GoogleFonts.inter(
                color: Color.fromRGBO(11, 116, 255, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          // Fade animation for subtitle
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              "Smart School Transport Tracking",
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 100),
          // Slide animation for progress indicator
          SlideTransition(
            position: _slideAnimation,
            child: CircularProgressIndicator(
              color: Color.fromRGBO(11, 116, 255, 1),
            ),
          ),
        ],
      ),
    );
  }
}