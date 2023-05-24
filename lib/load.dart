import 'package:flutter/material.dart';

void main() => runApp(Load());

class Load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Load Game',
      home: LevelListScreen(),
    );
  }
}

class LevelListScreen extends StatefulWidget {
  @override
  _LevelListScreenState createState() => _LevelListScreenState();
}

class _LevelListScreenState extends State<LevelListScreen> {
  List<int> levels = List.generate(25, (index) => index + 1);
  List<int> completedLevels = []; // List to track completed levels

  @override
  Widget build(BuildContext context) {
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
        title: Center(
          child: Text('Levels'),
        ),
      ),
      body: ListView.builder(
        itemCount: levels.length,
        itemBuilder: (BuildContext context, int index) {
          final int level = levels[index];
          final bool isUnlocked = completedLevels.contains(level);
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isUnlocked ? Colors.green : Colors.red, // Border color based on level lock status
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text('Level $level'),
                leading: Icon(
                  isUnlocked ? Icons.lock_open : Icons.lock, // Lock icon based on level lock status
                  color: isUnlocked ? Colors.green : Colors.red, // Icon color based on level lock status
                ),
              ),
            ),
            onTap: () {
              if (isUnlocked) {
                navigateToLevel(level);
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Level Locked'),
                      content: Text('Complete previous levels to unlock this level.'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }

  void navigateToLevel(int level) {
    switch (level) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Mayon()),
        ).then((_) {
          // Level 1 completed, add it to the completed levels list
          completeLevel(1);
        });
        break;
      case 2:
        if (completedLevels.contains(1)) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Banaue()),
          ).then((_) {
            // Level 2 completed, add it to the completed levels list
            completeLevel(2);
          });
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Level Locked'),
                content: Text('Complete previous levels to unlock this level.'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
        break;
      case 3:
        if (completedLevels.contains(2)) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Chocolatehills()),
          ).then((_) {
            // Level 3 completed, add it to the completed levels list
            completeLevel(3);
          });
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Level Locked'),
                content: Text('Complete previous levels to unlock this level.'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
        break;
    // Add more cases for other levels here
    }
  }

  void completeLevel(int level) {
    if (!completedLevels.contains(level)) {
      setState(() {
        completedLevels.add(level);
      });
    }
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

// Define the level classes (Mayon, Banaue, Chocolatehills, etc.) here
// Replace them with your actual implementation
class Mayon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mayon'),
      ),
      body: Center(
        child: Text('Mayon Level'),
      ),
    );
  }
}

class Banaue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banaue'),
      ),
      body: Center(
        child: Text('Banaue Level'),
      ),
    );
  }
}

class Chocolatehills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chocolate Hills'),
      ),
      body: Center(
        child: Text('Chocolate Hills Level'),
      ),
    );
  }
}
