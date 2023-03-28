import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_final/screens/Pre-builtQuiz.dart';
import 'package:quiz_final/screens/create_quiz.dart';
import 'package:quiz_final/widgets/list_card.dart';
import 'package:quiz_final/utility/card_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          margin:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(padding: const EdgeInsets.only(top: 10,left: 10),
                width: width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    const BoxShadow(
                      color: Color(0x19343c44),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                    const BoxShadow(
                      color: Color(0x0a75838e),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: const Color.fromRGBO(0, 13, 48, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: const Text(
                      "Create And Play  & \n Quiz!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateQuiz()));
                        },
                          child: Container(
                              alignment: Alignment.center,
                              width: 96,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(255,255,255,1),
                              ),
                              child:const Text(
                                "Create Quiz",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  letterSpacing: 0.50,
                                ),
                              )
                          ),
                        ),
                        Image(height: 100,image: Image.asset("assets/complete.png").image),
                      ],
                    )
                  ],
                ),

              ),
              const SizedBox(
                height: 40,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2,
                  viewportFraction: 0.5,
                  initialPage: 0,
                ),
                items: [

                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Marks()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: width * 0.80,
                      height: 86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0x66000000),
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xffbbebff), Colors.indigo],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Play Custom Quiz",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Chillax",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 49,
                            height: 49,
                            child: Stack(
                              children: [
                                Container(
                                  width: 49,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2.45,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 9.80,
                                      height: 15.87,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: Image.asset(
                                                  "assets/icons/arrow.png")
                                                  .image)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PreBuilt()));
                  },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: width * 0.80,
                      height: 86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0x66000000),
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xffbbebff), Colors.indigo],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Play Quiz Pre-Built",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Chillax",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 49,
                            height: 49,
                            child: Stack(
                              children: [
                                Container(
                                  width: 49,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2.45,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 9.80,
                                      height: 15.87,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: Image.asset(
                                                  "assets/icons/arrow.png")
                                                  .image)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: 30,
              ),
              Container(padding: EdgeInsets.only(top: 10,left: 10),
                width: width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19343c44),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Color(0x0a75838e),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: Colors.deepPurple,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: Text(
                      "Play with Your community",
                      style: TextStyle(
                        color: Color(0xff000d30),
                        fontSize: 14,
                      ),
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: 96,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xff000d30),
                            ),
                            child:Text(
                              "Join Us",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 0.50,
                              ),
                            )
                        ),
                        Image(height: 100,image: Image.asset("assets/policyadvice_contactus.png").image),
                      ],
                    )
                  ],
                ),

              ),


            ],
          ),
        ),
      ),
    );
  }
}
