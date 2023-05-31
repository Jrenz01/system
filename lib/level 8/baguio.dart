import 'package:flutter/material.dart';
import 'package:system/level%207/magellan.dart';
import 'package:system/level%209/taal.dart';

void main() => runApp(Baguio());

class Baguio extends StatefulWidget {
  @override
  _BaguioState createState() => _BaguioState();
}

class _BaguioState extends State<Baguio> {
  final List<TextEditingController> controllers = List.generate(
    6,
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
                    'assets/image/baguio.png',
                    width: 250,
                    height: 150,
                  ),
                ),
                Text(
                    '''\nBaguio City is a mountain resort town located in the province of Benguet, in the northern part of the Philippines. Today, Baguio City is a popular tourist destination in the Philippines, and is known for its cultural and historical landmarks, including the Baguio Cathedral, Burnham Park, and the Tam-Awan Village.\n\nFounded: 1900.\nBaguio is Summer Capital of the Philippines.'''),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Taal()),
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

  List<String> targetTexts = ['B', 'A', 'G', 'U', 'I', 'O'];
  List<String> firstbutton = ['E', 'G', 'O', 'A', 'R'];
  List<String> secondbutton = ['B', 'U', 'N', 'I', 'O'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level 8',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Magellan()),
              );
            },
          ),
          centerTitle: true,
          title: Text(
            'Level 8',
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
            SizedBox(height: 1),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/image/baguio.png',
                width: 350,
                height: 350,
              ),
            ),
            SizedBox(height: 1),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6, // Update the number of text boxes
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          if (controllers[index].text.isNotEmpty) {
                            clearTextBox(index);
                          }
                        },
                        child: Container(
                          width: 50,
                          child: TextField(
                            controller: controllers[index],
                            enabled:
                                false, // Disable editing if there is already a letter
                            textAlign: TextAlign.center,
                            maxLength: 1, // Set maximum character length to 1
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    firstbutton.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!isAnswerCorrect()) {
                            updateCurrentTextBox(firstbutton[index]);
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
                          firstbutton[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    secondbutton.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!isAnswerCorrect()) {
                            updateCurrentTextBox(secondbutton[index]);
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
                          secondbutton[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
