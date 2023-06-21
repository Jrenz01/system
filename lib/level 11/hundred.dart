import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/home.dart';
import 'package:system/level%2012/sanjuanico.dart';

import '../score_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ScoreProvider>(
      create: (_) => ScoreProvider(),
      child: MaterialApp(
        home: Hundred(),
      ),
    ),
  );
}

class Hundred extends StatefulWidget {
  @override
  _HundredState createState() => _HundredState();
}

class _HundredState extends State<Hundred> {
  final List<TextEditingController> controllers = List.generate(
    14,
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
                      'assets/image/hundred.png',
                      width: 250,
                      height: 150,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '''\nThe Hundred Islands National Park is a popular tourist destination located in the province of Pangasinan, in the northern part of the Philippines. The park is known for its scenic views, crystal-clear waters, and over 120 small islands and islets scattered throughout the area. \n\nAddress: 623Q+XFF, Alaminos, Pangasinan.\nEstablished: January 18, 1940.\nTotal islands: 123–124.''',
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
                    MaterialPageRoute(builder: (context) => Sanjuanico()),
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
    'H',
    'U',
    'N',
    'D',
    'R',
    'E',
    'D',
    'I',
    'S',
    'L',
    'A',
    'N',
    'D',
    'S',
  ];
  List<String> buttonLetters = [
    'M',
    'U',
    'N',
    'A',
    'D',
    'R',
    'I',
    'C',
    'E',
    'H',
    'P',
    'S',
    'G',
    'L',
    'T'
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
          title: Text(
            'Level 11',
            style: TextStyle(
              fontWeight: FontWeight.bold,
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
                            'This stunning destination in the Philippines consists of a group of islands scattered along the Lingayen Gulf, offering picturesque landscapes and opportunities for island hopping and water activities.',
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
                'assets/image/hundred.png',
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
                Wrap(
                  alignment: WrapAlignment.center,
                  children: List.generate(
                    14,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          if (controllers[index].text.isNotEmpty) {
                            clearTextBox(index);
                          }
                        },
                        child: Container(
                          width: 45,
                          child: TextField(
                            controller: controllers[index],
                            enabled: false,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: TextStyle(
                              color:
                                  targetTexts[index] == controllers[index].text
                                      ? Colors.white
                                      : Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  targetTexts[index] == controllers[index].text
                                      ? Colors.green
                                      : Colors.white,
                              counterText: '',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                                  horizontal: 20,
                                  vertical: 10,
                                ),
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
                                  horizontal: 20,
                                  vertical: 10,
                                ),
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
                        for (int i = 10; i < 15; i++)
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
                                  horizontal: 20,
                                  vertical: 10,
                                ),
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
          ],
        ),
      );
    });
  }
}
