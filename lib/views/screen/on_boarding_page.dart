/*=====================================================
* Program: on_boarding_page.dart
* Purpose: Introduction to user regarding the app key features & user engagement (Visually appealing)
* Notes: 
*======================================================
*/
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart'; //fluid page transaction
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // indicator at bottom of the screen
import 'package:google_fonts/google_fonts.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = LiquidController(); //control liquid swipe widget
  int currentPage = 0;

    //callback function triggered when  user swipes
    void onPageChangedCallback(int activePageIndex) {
    setState(() { //update state
      currentPage = activePageIndex; //current page is updated align with the current active page in lqd swipe wdgt
    });
    
  }
    // navigate to homepage
    void navigateToHomePage() {
      Navigator.pushReplacementNamed(context, '/homepage');
    }


@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      alignment: Alignment.center,
      children: [
        
        LiquidSwipe(
          // Making on boarding screen into 3 pages
          pages: [

            //Page 1
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
                          "Stay informed with ABC University community comprehensive coverage of news across various categories. Explore the most recent and relevant stories right at your fingertips.",
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

              //Page 2
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

              //Page 3
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.teal[100],
                child: Stack(
                  children: [
                    Column(
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
                      ],
                    ),
                    if (currentPage == 2) //Page 3
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
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
                    ),
                  ],
                ),
              ),
            ],
            //Arrow to swipe through screen
            liquidController: controller,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: onPageChangedCallback,
            ),
            
            //"skip" button
            Positioned(
              bottom: 50,
              child: currentPage == 0 || currentPage == 1
                  ? TextButton(
                      onPressed: () => controller.jumpToPage(page: 2),
                      child: Text(
                        "Skip", 
                        style: GoogleFonts.nunito(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : const SizedBox(), // show nothing
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



