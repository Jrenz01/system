import 'package:flutter/material.dart';
import 'package:system/fort.dart';

void main() => runApp(Boracay());

class Boracay extends StatefulWidget {
  @override
  _BoracayState createState() => _BoracayState();
}

class _BoracayState extends State<Boracay> {
  final List<TextEditingController> controllers = List.generate(
    7,
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

  List<String> targetTexts = ['B', 'O', 'R', 'A', 'C', 'A', 'Y'];
  List<String> firstbutton = ['E', 'Y', 'O', 'A', 'C'];
  List<String> secondbutton = ['B', 'U', 'N', 'R', 'L'];

  bool isAnswerCorrect() {
    for (var i = 0; i < controllers.length; i++) {
      if (controllers[i].text != targetTexts[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level 15',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Level 15',
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
                'assets/image/boracay.jpg',
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
                    7, // Update the number of text boxes
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
                      padding: EdgeInsets.symmetric(horizontal: 8),
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
                      padding: EdgeInsets.symmetric(horizontal: 8),
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
                SizedBox(height: 10),
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
                  child:
                  ElevatedButton(
                    onPressed: () {
                      if (isAnswerCorrect()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('WELL DONE!'),
                              content: Column(
                                children: [
                                  Image.asset('assets/image/boracay.jpg'), // Replace 'assets/image/mayon.jpg' with the actual image path
                                  Text(
                                    '\nBoracay is a resort island in the Western Visayas region of '
                                        'the Philippines, located 0.8 kilometers (0.50 mi) off the '
                                        'northwest coast of Panay. It has a total land area of '
                                        '10.32 square kilometers (3.98 sq mi), under the jurisdiction '
                                        'of three barangays in Malay, Aklan, and had a population of '
                                        '37,802 in 2020.Boracay was originally inhabited by the '
                                        'Tumandok and Ati people.',
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
                                        MaterialPageRoute(builder: (context) => Fort()),
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
          ],
        ),
      ),
    );
  }
}