import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding App',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Roboto'),
      home: const OnboardingPage1(),
    );
  }
}

// Onboarding Page 1
class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ---------- الجزء العلوي (الصورة + الخلفية البرتقالية) ----------
          Container(
            height: 330,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFF5A00),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(180),
                bottomRight: Radius.circular(180),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Skip button
                Positioned(
                  top: 40,
                  right: 20,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                    icon: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    label: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                // بيتزا
                Positioned(
                  child: SvgPicture.asset(
                    "assets/pizza-slice-02-svgrepo-com.svg",
                    width: 160,
                  ),
                ),
                // برجر
                Positioned(
                  left: 35,
                  top: 90,
                  child: SvgPicture.asset(
                    "assets/sandwich-burger-svgrepo-com.svg",
                    width: 90,
                  ),
                ),
                // هوت دوغ
                Positioned(
                  right: 40,
                  bottom: 65,
                  child: SvgPicture.asset(
                    "assets/hot-dog-svgrepo-com.svg",
                    width: 80,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // ---------- العنوان ----------
          const Text(
            "Name paragraph",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 12),

          // ---------- النص الوصفي ----------
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "Discover Delicious Recipes",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),

          const SizedBox(height: 25),

          // ---------- مؤشرات الصفحات ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5A00),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 8),
              _dot(),
              const SizedBox(width: 8),
              _dot(),
            ],
          ),

          const Spacer(),

          // ---------- زر NEXT ----------
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingPage2(),
                    ),
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),

          // ---------- زر Bake ----------
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: 300,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFF5A00), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                child: const Text(
                  "Bake",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFF5A00),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dot widget
  static Widget _dot() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}

// Onboarding Page 2
class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ---------- الجزء العلوي ----------
          Container(
            height: 330,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFF5A00),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(180),
                bottomRight: Radius.circular(180),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Skip button
                Positioned(
                  top: 40,
                  right: 20,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                    icon: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    label: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                // أيقونة الكتاب
                const Icon(Icons.book, size: 120, color: Colors.white),
              ],
            ),
          ),

          const SizedBox(height: 40),

          const Text(
            "Learn & Master",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 12),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "Follow step-by-step instructions and become a master chef in your own kitchen.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),

          const SizedBox(height: 25),

          // ---------- مؤشرات الصفحات ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dot(),
              const SizedBox(width: 8),
              Container(
                width: 20,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5A00),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 8),
              _dot(),
            ],
          ),

          const Spacer(),

          // زر NEXT
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingPage3(),
                    ),
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),

          // زر Back
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: 300,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFF5A00), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFF5A00),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _dot() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}

// Onboarding Page 3
class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ---------- الجزء العلوي ----------
          Container(
            height: 330,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFF5A00),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(180),
                bottomRight: Radius.circular(180),
              ),
            ),
            child: const Center(
              child: Icon(Icons.favorite, size: 120, color: Colors.white),
            ),
          ),

          const SizedBox(height: 40),

          const Text(
            "Save Your Favorites",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 12),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "Save your favorite recipes and access them anytime, anywhere. Build your personal cookbook.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),

          const SizedBox(height: 25),

          // ---------- مؤشرات الصفحات ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dot(),
              const SizedBox(width: 8),
              _dot(),
              const SizedBox(width: 8),
              Container(
                width: 20,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5A00),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),

          const Spacer(),

          // زر Get Started
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),

          // زر Back
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: 300,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFF5A00), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFF5A00),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _dot() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}

// Main Screen (Home)
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFFFF5A00),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 100, color: Color(0xFFFF5A00)),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Main Screen!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'You have completed onboarding',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingPage1(),
                  ),
                );
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Onboarding'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5A00),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
