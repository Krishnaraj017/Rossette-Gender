import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class SetTime extends StatelessWidget {
  const SetTime({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Timer(),
    );
  }
}

class Timer extends StatefulWidget {
  const Timer({Key? key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final PageController _pageController = PageController(initialPage: 0);
  int _pageIndex = 0;
  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;

  void _selectMale() {
    setState(() {
      _isMaleSelected = true;
      _isFemaleSelected = false;
    });
  }

  void _selectFemale() {
    setState(() {
      _isFemaleSelected = true;
      _isMaleSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .06),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * .36),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 5,
                  effect: SlideEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.black.withOpacity(0.5),
                    dotWidth: 10,
                    dotHeight: 5,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .13),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "What is Your Gender?",
                style: TextStyle(
                  wordSpacing: 1,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 123,
                        height: 123,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/image 2.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                       SizedBox(
                          height: MediaQuery.of(context).size.height * .03),
                      ElevatedButton(
                        onPressed: _selectMale,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ), backgroundColor: _isMaleSelected ? const Color(0xfE91EF) :const Color(0xFF2E91EF),
                            fixedSize: const Size(116, 24),
                        ),
                  
                        child: const Text("Male"),
                        
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 123,
                        height: 123,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/image 1.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                       SizedBox(
                          height: MediaQuery.of(context).size.height * .03),
                      
                      ElevatedButton(
                        onPressed: _selectFemale,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ), backgroundColor: _isFemaleSelected ? const Color(0xFE91EF): const Color(0xFF2E91EF),
                            fixedSize: const Size(116, 24),
                            ),
                        child: const Text("Female"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .3),
            
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * .06),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .60),
                Container(
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      });
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
