import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding_screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> onboardPages = [
    PageViewModel(
        title: 'Welcome!',
        bodyWidget: const Text(
          "Welcome to your personalized marketing dashboard! This is where the magic happens. Monitor real-time campaign performance, track your KPIs, and gain valuable insights into your audience's behavior.",
          style:
              TextStyle(color: Color.fromARGB(255, 72, 93, 104), fontSize: 17),
          textAlign: TextAlign.center,
        ),
        footer: Center(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8),
            onPressed: () {},
            child: const Text(
              "Get Started!",
              style: TextStyle(fontSize: 20),
            ),
          ),
        )),
        image: Image.asset(
          'assets/11.png',
          height: 500,
          alignment: Alignment.center,
        ),
        decoration: const PageDecoration(
          bodyPadding: EdgeInsets.all(8),
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        )),

        PageViewModel(
        title: 'Content Creation',
        bodyWidget: const Text(
          "Discover our content creation tools. Whether it's eye-catching graphics, persuasive copy, or interactive videos, we've got you covered.",
          style:
              TextStyle(color: Color.fromARGB(255, 72, 93, 104), fontSize: 17),
          textAlign: TextAlign.center,
        ),
        footer: Center(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8),
            onPressed: () {},
            child: const Text(
              "Get Started!",
              style: TextStyle(fontSize: 20),
            ),
          ),
        )),
        image: Image.asset(
          'assets/12.png',
          height: 500,
          alignment: Alignment.center,
        ),
        decoration: const PageDecoration(
          bodyPadding: EdgeInsets.all(8),
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        )),

        PageViewModel(
        title: 'Audience Targeting',
        bodyWidget: const Text(
          "Learn how to pinpoint your ideal audience. Our advanced targeting options help you reach the right people at the right time.",
          style:
              TextStyle(color: Color.fromARGB(255, 72, 93, 104), fontSize: 17),
          textAlign: TextAlign.center,
        ),
        footer: Center(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8),
            onPressed: () {},
            child: const Text(
              "Get Started!",
              style: TextStyle(fontSize: 20),
            ),
          ),
        )),
        image: Image.asset(
          'assets/13.png',
          height: 500,
          alignment: Alignment.center,
        ),
        decoration: const PageDecoration(
          bodyPadding: EdgeInsets.all(8),
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter on Boarding UI'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(1, 2, 1, 1),
        child: IntroductionScreen(
          pages: onboardPages,
          dotsDecorator: const DotsDecorator(
            size: Size(5, 5),
            color: Colors.blue,
            activeSize: Size.square(10),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 30,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
