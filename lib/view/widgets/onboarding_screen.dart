import 'package:ecommerceapp/controllers/auth_controller.dart';
import 'package:ecommerceapp/utils/app_teststyle.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/view/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<OnboardingItems> _items = [
    OnboardingItems(
      image: 'assets/images/onboard1.png',
      title: 'Enjoy Latest Trend',
      discription: 'Explore the newest Fashion trend',
    ),
    OnboardingItems(
      image: 'assets/images/onboard2.webp',
      title: 'Enjoy Latest Trend',
      discription: 'Explore the modern fashion sense',
    ),
    OnboardingItems(
      image: 'assets/images/onboard3.webp',
      title: 'Enjoy Latest Trend',
      discription: 'Explore the Professional Dressings',
    ),
  ];

  void handleGetStarted() {
    final AuthController authController = Get.find<AuthController>();
    authController.setFirstTimeDone();
    Get.off(() => const Signinscreen());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(_items[index].image, fit: BoxFit.cover),
                  ),
                  Text(
                    _items[index].title,
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_items[index].discription),
                ],
              );
            },
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  width: currentPage == index ? 24 : 8,
                  margin: .all(2),
                  height: 8,
                  duration: Duration(microseconds: 300),
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppTheme.light.primaryColor
                        : (isDark ? Colors.grey : Colors.grey[300]),
                    borderRadius: .circular(50),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 25,
            right: 16,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: GoogleFonts.poppins(
                  color: isDark ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                if (currentPage < _items.length - 1) {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  handleGetStarted();
                }
              },
              child: Container(
                width: 20,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.light.primaryColor,
                  borderRadius: .circular(50),
                ),
                child: Center(
                  child: Text(
                    currentPage < _items.length - 1 ? 'Next' : 'Get Started',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItems extends StatelessWidget {
  final String image;
  final String title;
  final String discription;
  const OnboardingItems({
    super.key,
    required this.image,
    required this.title,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
