import 'package:flutter/material.dart';
import 'package:system/level%201/mayon.dart';
import 'package:system/load.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Philippine Wonders',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Philippine Wonders'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/map.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PHILIPPINE WONDERS: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  'CAN YOU NAME THEM ALL? ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mayon()),
                    );
                  },
                  child: Text('PLAY'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(
                      fontSize: 30,
                    ),
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Load()),
                    );
                  },
                  child: Text('LEVELS'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    textStyle: TextStyle(
                      fontSize: 30,
                    ),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
