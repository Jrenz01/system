import 'package:flutter/material.dart';
import 'package:system/aguinaldo.dart';
import 'package:system/baguio.dart';
import 'package:system/bangui.dart';
import 'package:system/basco.dart';
import 'package:system/biri.dart';
import 'package:system/boracay.dart';
import 'package:system/chocolatehills.dart';
import 'package:system/corregidor.dart';
import 'package:system/enchanted.dart';
import 'package:system/fort.dart';
import 'package:system/home.dart';
import 'package:system/hundred.dart';
import 'package:system/intramuros.dart';
import 'package:system/luneta.dart';
import 'package:system/mactan.dart';
import 'package:system/magellan.dart';
import 'package:system/malacanang.dart';
import 'package:system/manila.dart';
import 'package:system/mayon.dart';
import 'package:system/banaue.dart';
import 'package:system/quiapo.dart';
import 'package:system/sagada.dart';
import 'package:system/sampaloc.dart';
import 'package:system/sanagustin.dart';
import 'package:system/sanjuanico.dart';
import 'package:system/taal.dart';
import 'package:system/tagaytay.dart';
import 'package:system/underground.dart';
import 'package:system/vigan.dart';

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

class LevelListScreen extends StatelessWidget {
  final List<int> levels = List.generate(30, (index) => index + 1);

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
          return ListTile(
            title: Text('Level $level'),
            onTap: () {
              if (level == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mayon()),
                );
              } else if (level == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Banaue()),
                );
              } else if (level == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chocolatehills()),
                );
              } else if (level == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Luneta()),
                );
              } else if (level == 5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Intramuros()),
                );
              } else if (level == 6) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Vigan()),
                );
              } else if (level == 7) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Magellan()),
                );
              } else if (level == 8) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Baguio()),
                );
              } else if (level == 9) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Taal()),
                );
              } else if (level == 10) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Malacanang()),
                );} else if (level == 11) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Hundred()),
                );
              } else if (level == 12) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sanjuanico()),
                );
              } else if (level == 13) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mactan()),
                );
              } else if (level == 14) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Aguinaldo()),
                );
              } else if (level == 15) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Boracay()),
                );
              } else if (level == 16) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fort()),
                );} else if (level == 17) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Manila()),
                );
              } else if (level == 18) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sampaloc()),
                );
              } else if (level == 19) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Underground()),
                );
              } else if (level == 20) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quiapo()),
                );
              } else if (level == 21) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Corregidor()),
                );
              } else if (level == 22) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sanagustin()),
                );
              } else if (level == 23) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tagaytay()),
                );
              } else if (level == 24) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Enchanted()),
                );
              } else if (level == 25) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bangui()),
                );
              } else if (level == 26) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sagada()),
                );
              } else if (level == 27) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Basco()),
                );
              } else if (level == 28) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Biri()),
                );
              } else {
                // Handle other levels here
              }
            },
          );
        },
      ),
    );
  }
}