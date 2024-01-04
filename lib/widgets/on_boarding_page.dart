import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = LiquidController();
  int currentPage = 0;

    void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
    
  }

    void navigateToHomePage() {
      Navigator.pushReplacementNamed(context, '/homepage');
    }


@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  
  return Scaffold(
    body: Stack(
      alignment: Alignment.center,
      children: [
        LiquidSwipe(
          pages: [
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.teal[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/on_boarding/on-boarding-1.png",
                  width: 400,
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      Text("Discover the Latest Campus News",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 27.0,
                        color: Colors.black
                        )),
                        const SizedBox(height: 30),
                        Text(
                          "Stay informed with UMT community comprehensive coverage of news across various categories. Explore the most recent and relevant stories right at your fingertips.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                          fontSize: 16.0,
                          color: Colors.black,
                        )),
                        const SizedBox(height: 50.0)
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/on_boarding/on-boarding-2.png",
                    width: 250,
                    ),
                    Column(
                      children: [
                        Text("Build Your Favorites \nCollection",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                          color: Colors.black
                        ),),
                        const SizedBox(height: 30),
                        Text(
                          "Bookmark your favorite news articles in one place. Easily access and revisit the content that matters \nmost to you.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),),
                        const SizedBox(height: 50.0)
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.teal[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/on_boarding/on-boarding-3.png",
                    width: 350,
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        Text("Stay Connected, \nStay Informed",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                          color: Colors.black
                        ),),
                        const SizedBox(height: 30),
                        Text(
                          "The app keeps you connected to the pulse of campus life. Receive real-time updates on news, ensuring \nyou're always in the know about what's \nhappening.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),),
                        const SizedBox(height: 50.0)
                      ],
                    ),
                    if (currentPage == 2)
                    Positioned(
                      bottom: 20,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0), 
                          ),
                           padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, 
                            vertical: 16.0),
                            minimumSize: const Size(200.0, 40.0),
                          ),
                          onPressed: navigateToHomePage,
                          child: Text("Get Started",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            liquidController: controller,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: onPageChangedCallback,
            ),
            
            //skip button
            Positioned( 
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () => controller.jumpToPage(page: 2),
                child: Text("Skip", 
                style: GoogleFonts.nunito(
                  fontSize: 16.0,
                  color: Colors.grey
                )),
              )
            ),
            //the dots at the bottom when swiping
            //active index must have controller
            Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage, 
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0
                ),
              )
            )
        ],
      ),
    );
  }
}


