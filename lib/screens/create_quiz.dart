import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';
import 'package:quiz_final/provider/register_provider.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static var _isInit = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  List<String> gender = ["Select Gender", "Male", "Female", "Others"];

  List<String> category = ["Select Category", "Art And Literature", "Film And Tv", "Food And Drink","General Knowledge","History","Music","Science","Sports And Leisure"];

  List<String> difficulty = ["Select Difficulty", "Easy", "Medium", "Hard"];


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      //Provider.of<RegisterProvider>(context, listen: false).getCity();
      setState(() {
        _isInit = false;
      });
    }
  }

  @override
  void dispose() {
    setState(() {
      _isInit = true;
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var reg = Provider.of<RegisterProvider>(context);
    //     var data = Provider.of<Onboarding>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Colors.white,
                Color.fromRGBO(0, 13, 48, 1),
              ])),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      height: 60,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: Colors.white,


                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Create Quiz",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: "Playfair Display",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Question",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Question',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          controller: reg.questionController,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Option1",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Option1',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          controller:reg.option1Controller,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          obscureText: false,
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),


                            hintText: "Option2",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Option2',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          controller: reg.option2Controller,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Option3",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Option3',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          controller:reg.option3Controller,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),

                            hintText: "Option4",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Option4',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          controller:reg.option4Controller,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),


                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 40,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 1, color: Color.fromRGBO(248, 173, 13, 1)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                            alignment: AlignmentDirectional.centerStart,
                            //   borderRadius: BorderRadius.circular(12),
                            //   color: ConstantColors.mainColor,
                            // ),
                            buttonHeight: 20,
                            buttonWidth: 60,
                            itemHeight: 35,
                            dropdownMaxHeight: height * 0.60,
                            value: reg.category,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            onChanged: (newValue) {
                              reg.updatecategory(newValue!);
                            },
                            items: category.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(value,
                                        style: const TextStyle(
                                          fontFamily: "lato",
                                          color: Colors.black,
                                          fontSize: 17,
                                        ))
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),




                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),


                            hintText: "Anwser",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Anwser',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          controller: reg.anwserController,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 40,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 1, color: Color.fromRGBO(248, 173, 13, 1)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                            alignment: AlignmentDirectional.centerStart,
                            //   borderRadius: BorderRadius.circular(12),
                            //   color: ConstantColors.mainColor,
                            // ),
                            buttonHeight: 20,
                            buttonWidth: 60,
                            itemHeight: 35,
                            dropdownMaxHeight: height * 0.60,
                            value: reg.difficulty,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            onChanged: (newValue) {
                              reg.updatedifficulty(newValue!);
                            },
                            items: difficulty.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(value,
                                        style: const TextStyle(
                                          fontFamily: "lato",
                                          color: Colors.black,
                                          fontSize: 17,
                                        ))
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: width,
                        height: 50,
                        child: TextFormField(
                          //  controller: userInput,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(248, 173, 13, 1),
                            fontWeight: FontWeight.w600,
                          ),

                          decoration: InputDecoration(
                            focusColor: const Color.fromRGBO(248, 173, 13, 1),
                            //add prefix icon

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(248, 173, 13, 1),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: const Color.fromRGBO(248, 173, 13, 1),


                            hintText: "Explaination",

                            //make hint text
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),

                            //create lable
                            labelText: 'Explaination',
                            //lable style
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(248, 173, 13, 1),
                              fontSize: 16,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          controller: reg.explainationController,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                        width: width,
                        height: 50,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.black),
                          onPressed: () {
                            reg.createquiz(context);
                          },
                          child: Container(
                            width: width,
                            child: const Text(
                              "Submit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ))),
    );
  }
}