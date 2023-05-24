import 'package:flutter/material.dart';
import 'package:system/manila.dart';

void main() => runApp(Fort());

class Fort extends StatefulWidget {
  @override
  _FortState createState() => _FortState();
}

class _FortState extends State<Fort> {
  final List<TextEditingController> controllers = List.generate(
    12,
        (_) => TextEditingController(),
  );

  int currentTextBoxIndex = 0;
  int clearedTextBoxCount = 0;

  void updateCurrentTextBox(String text) {
    if (currentTextBoxIndex < controllers.length && controllers[currentTextBoxIndex].text.isEmpty) {
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
    'F',
    'O',
    'R',
    'T',
    'S',
    'A',
    'N',
    'T',
    'I',
    'A',
    'G',
    'O'
  ];
  List<String> buttonLetters = [
    'T',
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
    'G',
    'L',
    'F'
  ];

  bool isSubmitClicked = false;

  bool _showHint = false;

  void _toggleHint() {
    setState(() {
      _showHint = !_showHint;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level 16',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Center(
            child: Text(
              'Level 16',
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
                          title: Text('Hint'),
                          content: Text(
                            'Hint.',
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/image/fort.png',
                width: 380,
                height: 230,
              ),
            ),
            SizedBox(height:15),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 4; i++)
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
                SizedBox(height:1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 4; i < 12; i++)
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
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!isAnswerCorrect()) {
                              updateCurrentTextBox(buttonLetters[i]);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!isAnswerCorrect()) {
                              updateCurrentTextBox(buttonLetters[i]);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!isAnswerCorrect()) {
                              updateCurrentTextBox(buttonLetters[i]);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                gradient: isAnswerCorrect()
                    ? LinearGradient(
                  colors: [Colors.green, Colors.lightGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                    : LinearGradient(
                  colors: [Colors.red, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (isAnswerCorrect()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('WELL DONE!'),
                          content: Column(
                            children: [
                              Image.asset('assets/image/fort.png'), // Replace 'assets/image/mayon.jpg' with the actual image path
                              Text(
                                '\nFort Santiago, built in 1571, is a citadel built by Spanish '
                                    'navigator and governor Miguel López de Legazpi for the '
                                    'newly established city of Manila in the Philippines. '
                                    'The defense fortress is located in Intramuros, '
                                    'the walled city of Manila.',
                              ),
                            ],
                          ),
                          backgroundColor: Colors.greenAccent, // Set the background color to green
                          actions: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: TextButton(
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Manila()),
                                  );
                                },
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Colors.red,
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Incorrect Answer',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Oops! Your answer is incorrect.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.5); // Change the color when the button is pressed
                      }
                      return Colors.blue; // Default color
                    },
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
