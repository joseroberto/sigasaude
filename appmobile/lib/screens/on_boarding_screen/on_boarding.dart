import 'package:covid_data_app/screens/on_boarding_screen/widgets/first_screen.dart';
import 'package:covid_data_app/screens/on_boarding_screen/widgets/fourth_screen.dart';
import 'package:covid_data_app/screens/on_boarding_screen/widgets/second_screen.dart';
import 'package:covid_data_app/screens/on_boarding_screen/widgets/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late int selectedPage;
  late final PageController _pageController;
  List<Widget> pages = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const FourthScreen()
  ];

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        actions: [
          TextButton(
            onPressed: (() {
              Navigator.pushReplacementNamed(context, 'auth');
            }),
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                'pular',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Color(0xff000000),
                  letterSpacing: 0.144,
                  height: 1.125,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xffffffff),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    selectedPage = page;
                  });
                },
                children: List.generate(pages.length, (index) {
                  return pages.elementAt(index);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PageViewDotIndicator(
                currentItem: selectedPage,
                count: pages.length,
                unselectedColor: Colors.black26,
                selectedColor: const Color.fromRGBO(0, 168, 88, 1),
                duration: const Duration(milliseconds: 200),
                boxShape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xffffffff),
        elevation: 0.0,
        child: OutlinedButton(
          onPressed: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
            if (selectedPage == 3) {

              Navigator.pushReplacementNamed(context, 'auth');
            }
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            side: const BorderSide(
              width: 1.0,
              color: Color(0x8f95989a),
            ),
          ),
          child: const Text(
            'Continuar',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Color(0xff000000),
              letterSpacing: 0.162,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ),
      ),
    );
  }
}
