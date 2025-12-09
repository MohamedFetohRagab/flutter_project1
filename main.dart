import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const FoodiApp());
}

class FoodiApp extends StatelessWidget {
  const FoodiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FoodiSplashScreen(), // ← ابدأ بشاشة Splash
    );
  }
}

class FoodiSplashScreen extends StatefulWidget {
  const FoodiSplashScreen({super.key});

  @override
  State<FoodiSplashScreen> createState() => _FoodiSplashScreenState();
}

class _FoodiSplashScreenState extends State<FoodiSplashScreen> {
  @override
  void initState() {
    super.initState();
    // بعد 3 ثواني انتقل لشاشة Onboarding
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5A00),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // أيقونات الطعام من SVG
            Stack(
              alignment: Alignment.center,
              children: [
                // بيتزا في المنتصف
                SvgPicture.asset(
                  'assets/pizza-slice-02-svgrepo-com.svg',
                  width: 100,
                  height: 100,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),

                // برجر على اليسار
                Positioned(
                  left: -40,
                  top: 20,
                  child: SvgPicture.asset(
                    'assets/sandwich-burger-svgrepo-com.svg',
                    width: 60,
                    height: 60,
                    colorFilter: const ColorFilter.mode(
                      Colors.white70,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                // هوت دوغ على اليمين
                Positioned(
                  right: -40,
                  bottom: 10,
                  child: SvgPicture.asset(
                    'assets/hot-dog-svgrepo-com.svg',
                    width: 60,
                    height: 60,
                    colorFilter: const ColorFilter.mode(
                      Colors.white70,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // اسم التطبيق
            const Text(
              'Foodi',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 8),

            // شعار أو وصف قصير
            const Text(
              'Delicious food delivered',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A minimal OnboardingScreen widget so the referenced name exists.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
        backgroundColor: const Color(0xFFFF5A00),
      ),
      body: const Center(child: Text('Onboarding content goes here')),
    );
  }
}
