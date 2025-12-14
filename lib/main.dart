import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'screens/onboarding.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const FoodiApp());
}

class FoodiApp extends StatelessWidget {
  const FoodiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => const FoodiSplashScreen(),
        '/onboarding1': (context) => const Onboarding1(),
        '/onboarding2': (context) => const Onboarding2(),
        '/onboarding3': (context) => const Onboarding3(),
        '/login': (context) => const SignInScreen(),
        '/home': (context) => const HomeScreen(),
      },
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
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding1');
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
