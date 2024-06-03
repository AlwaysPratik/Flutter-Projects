import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    
    {
      "question": "What is Flutter?",
      "options": [
        " A programming language",
        " A mobile app development framework", 
        " A database management system",
        " An operating system"
        ],
      "answerIndex": 1,
    },
    {
      "question": "Which programming language is used for Flutter development?",
      "options": [
        " Java", 
        " Swift", 
        " Dart", 
        " Python"
        ],
      "answerIndex": 2,
    },
    {
      "question": "Which widget is used to create a list in Flutter?",
      "options": [
        " ListContainer", 
        " ListLayout", 
        " ListWidget", 
        " ListView"
        ],
      "answerIndex": 3,
    },
    {
      "question": "Which element is used as an identifier in Flutter?",
      "options": [
        " Serial", 
        " Widgets", 
        " Keys", 
        " All of the above"
        ],
      "answerIndex": 2,
    },
    {
      "question": "Which widget is used to create a text input field in Flutter?",
      "options": [
        " TextField",
        " Text", 
        " TextInput", 
        " InputField"
         ],
      "answerIndex": 0,
    },
  ];


  bool questionScreen = true;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int noOfCorrectAnswers = 0;

    MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
      if (selectedAnswerIndex != -1) {
        if (buttonIndex ==
  allQuestions[questionIndex]["answerIndex"]) {
          return const MaterialStatePropertyAll(Colors.green);
        } else if (buttonIndex == selectedAnswerIndex) {
          return const MaterialStatePropertyAll(Colors.red);
        } else {
          return const MaterialStatePropertyAll(null);
        }
      } else {
        return const MaterialStatePropertyAll(null);
      }
    }

    void validateCurrentPage() {
      if (selectedAnswerIndex == -1) {
          return;
        }

        if (selectedAnswerIndex ==
    allQuestions[questionIndex]["answerIndex"]) {
        noOfCorrectAnswers += 1;
      }

        if (selectedAnswerIndex != -1) {
          if (questionIndex == allQuestions.length - 1) {
              setState(() {
                questionScreen = false;
              });
            }

              selectedAnswerIndex = -1;
              setState(() {
                questionIndex += 1;
              });
            }
          }

    Scaffold isQuestionScreen() {
      if (questionScreen == true) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: const Text(
              "QuizApp",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            ),

            body: 
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/back.jpg"),
                  fit: BoxFit.cover,
                )
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  const Text(
                    "Questions : ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 81, 59, 59),
                      ),
                    ),
                    Text(
                      "${questionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 81, 59, 59),
                    ),
                  ),
                ],
              ),
                const SizedBox(
                  height: 40,
                ),
              
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 3, left: 15, bottom: 3, right: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 214, 211, 211),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                      allQuestions[questionIndex]["question"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ),
              
                const SizedBox(
                  height: 50,
                ),
              
                SizedBox(
                  height: 70,
                  width: 350,
                  child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                              backgroundColor: checkAnswer(0),
                            ),
                            onPressed: () {
                              if (selectedAnswerIndex == -1) {
                                setState(() {
                                  selectedAnswerIndex = 0;
                                });
                              }
                            },
                      child: Text(
                        "A. ${allQuestions[questionIndex]["options"][0]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                  ),
                ),
                
                const SizedBox(
                  height: 20,
                ),
              
                SizedBox(
                  height: 70,
                  width: 350,
                  child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(color: Colors.black, width: 2),
                                  ),
                                ),
                                backgroundColor: checkAnswer(1),
                              ),
                            onPressed: () {
                              if (selectedAnswerIndex == -1) {
                                setState(() {
                                  selectedAnswerIndex = 1;
                                });
                              }
                            },
                      child: Text(
                        "B. ${allQuestions[questionIndex]["options"][1]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              
                SizedBox(
                  height: 70,
                  width: 350,
                  child: ElevatedButton(
                           style: ButtonStyle(
                                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(color: Colors.black, width: 2),
                                  ),
                                ),
                                backgroundColor: checkAnswer(2),
                              ),
                            onPressed: () {
                              if (selectedAnswerIndex == -1) {
                                setState(() {
                                  selectedAnswerIndex = 2;
                                });
                              }
                            },
                      child: Text(
                        "C. ${allQuestions[questionIndex]["options"][2]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
               
                SizedBox(
                  height: 70,
                  width: 350,
                  child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(color: Colors.black, width: 2),
                                  ),
                                ),
                                backgroundColor: checkAnswer(3),
                              ),
                            onPressed: () {
                              if (selectedAnswerIndex == -1) {
                                setState(() {
                                  selectedAnswerIndex = 3;
                                });
                              }
                            },
                      child: Text(
                        "D. ${allQuestions[questionIndex]["options"][3]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                  ),
                ),
              ],
                        ),
            ),

         floatingActionButton: 
         Directionality(
          textDirection: TextDirection.rtl,
           child: FloatingActionButton.extended( 
            label: const Text("Next"),
            foregroundColor: Colors.cyanAccent,
            backgroundColor: Colors.indigo,
            icon: const Icon(Icons.keyboard_arrow_right_outlined,
            ),
             onPressed: () {
                validateCurrentPage();
              },
            ),
         ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: const Text("QuixApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          ),
          body: 
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/back.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 430,
                    width: 480,
                    child: Image.asset("assets/trophy.png")),
                          const Text(
                            "Congratulations!!!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "You have completed the Quiz",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text("$noOfCorrectAnswers/${allQuestions.length}",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
            
                      const SizedBox(
                        height: 30,
                      ),
            
                        ElevatedButton(
                          onPressed: () {
                              questionIndex = 0;
                              questionScreen = true;
                              noOfCorrectAnswers = 0;
                              selectedAnswerIndex = -1;
            
                                setState(() {});
                              },
                              child: const Text(
                                "Reset",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                            ),
                          ))
                        ],
                ),
            ),
          ),
         );
      }
    }

    @override
    Widget build(BuildContext context) {
      return isQuestionScreen();
    }
  }