import 'package:flutter/material.dart';
import 'package:system/level%2013/mactan.dart';
import 'package:system/level%2015/boracay.dart';

void main() => runApp(Aguinaldo());

class Aguinaldo extends StatefulWidget {
  @override
  _AguinaldoState createState() => _AguinaldoState();
}

class _AguinaldoState extends State<Aguinaldo> {
  final List<TextEditingController> controllers = List.generate(
    15,
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
            content: Column(
              children: [
                Container(
                  child: Image.asset(
                    'assets/image/aguinaldo.jpg',
                    width: 250,
                    height: 150,
                  ),
                ),
                Text(
                    '''\nThe Emilio Aguinaldo Shrine or the Cavite El Viejo Shrine is a national shrine located in Kawit, Cavite in the Philippines, where the Philippine Declaration of Independence from Spain was declared on June 12, 1898 or Independence Day, To commemorate the event, now known as Araw ng Kalayaan or Independence Day, a national holiday.\n\nConstruction started: 1845.\nBurials: Emilio Aguinaldo.'''),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Boracay()),
                  );
                },
                child: Text('Next'),
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
            title: Text('Incorrect Answer'),
            content: Column(
              children: [
                Text(
                  'Oops! Your answer is incorrect.',
                  style: TextStyle(
                    fontSize: 16,
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
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
    'A',
    'G',
    'U',
    'I',
    'N',
    'A',
    'L',
    'D',
    'O',
    'S',
    'H',
    'R',
    'I',
    'N',
    'E'
  ];
  List<String> buttonLetters = [
    'L',
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
    'O',
    'B'
  ];

  bool isSubmitClicked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level 14',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mactan()),
              );
            },
          ),
          centerTitle: true,
          title: Text(
            'Level 14',
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
                          title: Text('Hint'),
                          content: Text(
                            'Hint',
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
            SizedBox(height: 40),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/image/aguinaldo.jpg',
                width: 350,
                height: 250,
              ),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: List.generate(
                    15,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: GestureDetector(
                        onTap: () {
                          if (controllers[index].text.isNotEmpty) {
                            clearTextBox(index);
                          }
                        },
                        child: Container(
                          width: 37,
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
                                primary: Colors.blue,
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
                                primary: Colors.blue,
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
                                primary: Colors.blue,
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
      ),
    );
  }
}
