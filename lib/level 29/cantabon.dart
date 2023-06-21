import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/home.dart';
import 'package:system/level%2030/burnham.dart';

import '../score_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ScoreProvider>(
      create: (_) => ScoreProvider(),
      child: MaterialApp(
        home: Cantabon(),
      ),
    ),
  );
}

class Cantabon extends StatefulWidget {
  @override
  _CantabonState createState() => _CantabonState();
}

class _CantabonState extends State<Cantabon> {
  final List<TextEditingController> controllers = List.generate(
    12,
    (_) => TextEditingController(),
  );

  int currentTextBoxIndex = 0;
  int clearedTextBoxCount = 0;

  void updateCurrentTextBox(String text) {
    if (currentTextBoxIndex < controllers.length &&
        controllers[currentTextBoxIndex].text.isEmpty) {
      controllers[currentTextBoxIndex].text = text;
      currentTextBoxIndex++;
      if (clearedTextBoxCount >= 3) {
        clearedTextBoxCount = 0;
        for (var i = currentTextBoxIndex; i < controllers.length; i++) {
          if (controllers[i].text.isEmpty) {
            currentTextBoxIndex = i;
            break;
          }
        }
      }
    } else {
      for (var i = 0; i < controllers.length; i++) {
        if (controllers[i].text.isEmpty) {
          controllers[i].text = text;
          currentTextBoxIndex = i + 1;
          break;
        }
      }
    }
    if (isAnswerCorrect()) {
      final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);
      scoreProvider.incrementScore();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(vertical: 120, horizontal: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Center(
              child: Text(
                'Well Done!',
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/image/cantabon.jpg',
                      width: 250,
                      height: 150,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '''\nLocated in central Siquijor the Philippines, Cantabon Cave is an adventurous trail inside a pitch-black cave beneath the earth. From a small hole in the ground, local guides lead visitors into this unique Siquijor tourist attraction.\n\nBiggest Cave in the Philippines.''',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Burnham()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Customize button color
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else if (currentTextBoxIndex >= controllers.length) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(vertical: 280, horizontal: 70),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Text(
              'Incorrect Answer',
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
              ),
            ),
            content: Column(
              children: [
                Text(
                  'Oops! Your answer is incorrect.',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            backgroundColor:
                Colors.redAccent, // Set the background color to red
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Customize button color
                ),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void clearTextBox(int index) {
    controllers[index].clear();
    currentTextBoxIndex = index;
    clearedTextBoxCount++;

    if (clearedTextBoxCount >= 3) {
      clearedTextBoxCount = 0;
      for (var i = 0; i < controllers.length; i++) {
        if (controllers[i].text.isEmpty) {
          currentTextBoxIndex = i;
          break;
        }
      }
    }
  }

  bool isAnswerCorrect() {
    for (var i = 0; i < controllers.length; i++) {
      if (i >= targetTexts.length || controllers[i].text != targetTexts[i]) {
        return false;
      }
    }
    return true;
  }

  List<String> targetTexts = [
    'C',
    'A',
    'N',
    'T',
    'A',
    'B',
    'O',
    'N',
    'C',
    'A',
    'V',
    'E'
  ];
  List<String> buttonLetters = [
    'B',
    'U',
    'N',
    'A',
    'O',
    'R',
    'I',
    'C',
    'E',
    'V',
    'P',
    'S',
    'T',
    'L',
    'D'
  ];

  bool isSubmitClicked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreProvider>(builder: (context, scoreProvider, _) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          backgroundColor: Colors.black54,
          centerTitle: true,
          title: Center(
            child: Text(
              'Level 29',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Container(
              width: 40,
              height: 40,
              child: IconButton(
                onPressed: () {
                  if (!isAnswerCorrect()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              SizedBox(width: 5),
                              Text(
                                'Hint',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.lightbulb_circle,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                          content: Text(
                            'C_NTA_ON   '
                            'C_V_',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Colors.black54,
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.white, // Customize button color
                              ),
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                icon: Icon(
                  Icons.lightbulb,
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlue[100],
        body: Column(
          children: [
            SizedBox(height: 40),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/image/cantabon.jpg',
                width: 380,
                height: 230,
              ),
            ),
            SizedBox(height: 10),
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Score: ${scoreProvider.score}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 8; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            if (controllers[i].text.isNotEmpty) {
                              clearTextBox(i);
                            }
                          },
                          child: Container(
                            width: 40,
                            child: TextField(
                              controller: controllers[i],
                              enabled: false,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: TextStyle(
                                color: targetTexts[i] == controllers[i].text
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: targetTexts[i] == controllers[i].text
                                    ? Colors.green
                                    : Colors.white,
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 8; i < 12; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: GestureDetector(
                          onTap: () {
                            if (controllers[i].text.isNotEmpty) {
                              clearTextBox(i);
                            }
                          },
                          child: Container(
                            width: 37,
                            child: TextField(
                              controller: controllers[i],
                              enabled: false,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: TextStyle(
                                color: targetTexts[i] == controllers[i].text
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: targetTexts[i] == controllers[i].text
                                    ? Colors.green
                                    : Colors.white,
                                counterText: '',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!isAnswerCorrect()) {
                              updateCurrentTextBox(buttonLetters[i]);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black54,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          child: Text(
                            buttonLetters[i],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 5; i < 10; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!isAnswerCorrect()) {
                              updateCurrentTextBox(buttonLetters[i]);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black54,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          child: Text(
                            buttonLetters[i],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 10; i < buttonLetters.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!isAnswerCorrect()) {
                              updateCurrentTextBox(buttonLetters[i]);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black54,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          child: Text(
                            buttonLetters[i],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
