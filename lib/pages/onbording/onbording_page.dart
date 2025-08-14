import 'package:demo/pages/onbording/front_page.dart';
import 'package:demo/pages/onbording/sharedOnbording_widgets.dart';
import 'package:demo/pages/onbording/user_details_page.dart';
import 'package:demo/services/data/onbording_services.dart';
import 'package:demo/util/color.dart';
import 'package:demo/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingPage extends StatefulWidget {
  const OnBordingPage({super.key});

  @override
  State<OnBordingPage> createState() => _OnBordingPageState();
}

class _OnBordingPageState extends State<OnBordingPage> {
  bool showDetailsPage = false;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3;
                    });
                  },
                  children: [
                    FrontPage(),
                    SharedOnBordingWidgets(
                      imagePath: OnbardingData.onboardingList[0].imagePath,
                      title: OnbardingData.onboardingList[0].title,
                      description: OnbardingData.onboardingList[0].description,
                    ),
                    SharedOnBordingWidgets(
                      imagePath: OnbardingData.onboardingList[1].imagePath,
                      title: OnbardingData.onboardingList[1].title,
                      description: OnbardingData.onboardingList[1].description,
                    ),
                    SharedOnBordingWidgets(
                      imagePath: OnbardingData.onboardingList[2].imagePath,
                      title: OnbardingData.onboardingList[2].title,
                      description: OnbardingData.onboardingList[2].description,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: WormEffect(
                      dotColor: kBlack,
                      activeDotColor: kLightYellow,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),

                    child: !showDetailsPage
                        ? GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                _pageController.page!.toInt() + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },

                            child: CustomButton(
                              buttonName: showDetailsPage
                                  ? "Get Started"
                                  : "Next",

                              buttonColor: kGreen,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsPage(),
                                ),
                              );
                            },

                            child: CustomButton(
                              buttonName: showDetailsPage
                                  ? "Get Started"
                                  : "Next",

                              buttonColor: kGreen,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
