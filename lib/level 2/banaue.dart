import 'package:flutter/material.dart';
import 'package:system/home.dart';
import 'package:system/level%203/chocolatehills.dart';

void main() => runApp(Banaue());

class Banaue extends StatefulWidget {
  @override
  _BanaueState createState() => _BanaueState();
}

class _BanaueState extends State<Banaue> {
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
            title: Text('WELL DONE!'),
            content: Column(
              children: [
                Image.asset('assets/image/banaue.jpg'), // Replace 'assets/image/mayon.jpg' with the actual image path
                Text(
                  '\nThe Banaue Rice Terraces are a National Cultural Treasure of the '
                      'Philippines and are considered to be the 8th Natural Wonder '
                      'of the World by many Filipinos.  The view is spectacular, '
                      'majestic and inspiring.  The Banaue Rice Terraces are located '
                      'on the mountains of Ifugao and were carved there about 2,000 '
                      'years ago by the ancestors of the present day Philippines. '
                      'It is said that they were built by hand and were used to plant rice.',
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
                      MaterialPageRoute(builder: (context) => Chocolatehills()),
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

  List<String> targetTexts = ['B', 'A', 'N', 'A', 'U', 'E'];
  List<String> firstbutton = ['E', 'S', 'O', 'A', 'R'];
  List<String> secondbutton = ['B', 'U', 'N', 'A', 'O'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level 2',
      home: Scaffold(
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
          centerTitle: true,
          title: Text(
            'Level 2',
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
            SizedBox(height: 1),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/image/banaue.jpg',
                width: 380,
                height: 230,
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
                            enabled: false, // Disable editing if there is already a letter
                            textAlign: TextAlign.center,
                            maxLength: 1, // Set maximum character length to 1
                            style: TextStyle(
                              color: targetTexts[index] == controllers[index].text ? Colors.white : Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: targetTexts[index] == controllers[index].text ? Colors.green : Colors.white,
                              counterText: '',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
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