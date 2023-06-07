import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:system/level%201/mayon.dart';
import 'package:system/load.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 60),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(2, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Philippine Wonders',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[600],
          centerTitle: true,
          title: Text('Philippine Wonders'),
        ),
        body: AnimatedContainer(
          duration: Duration(seconds: 60),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/map.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment(_animation.value.dx, _animation.value.dy),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
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
                        backgroundColor: Color.fromRGBO(0, 0, 200, 1),
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
                        backgroundColor: Color.fromRGBO(0, 0, 200, 1),
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
        ),
      ),
    );
  }
}
