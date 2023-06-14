import 'package:flutter/material.dart';
import 'package:system/level%201/mayon.dart';
import 'package:system/level%2010/malacanang.dart';
import 'package:system/level%2011/hundred.dart';
import 'package:system/level%2012/sanjuanico.dart';
import 'package:system/level%2013/mactan.dart';
import 'package:system/level%2014/aguinaldo.dart';
import 'package:system/level%2015/boracay.dart';
import 'package:system/level%2016/fort.dart';
import 'package:system/level%2017/manila.dart';
import 'package:system/level%2018/sampaloc.dart';
import 'package:system/level%2019/underground.dart';
import 'package:system/level%202/banaue.dart';
import 'package:system/level%2020/quiapo.dart';
import 'package:system/level%2021/corregidor.dart';
import 'package:system/level%2022/sanagustin.dart';
import 'package:system/level%2023/tagaytay.dart';
import 'package:system/level%2024/enchanted.dart';
import 'package:system/level%2025/bangui.dart';
import 'package:system/level%2026/sagada.dart';
import 'package:system/level%2027/basco.dart';
import 'package:system/level%2028/biri.dart';
import 'package:system/level%2029/cantabon.dart';
import 'package:system/level%203/chocolatehills.dart';
import 'package:system/level%2030/burnham.dart';
import 'package:system/level%204/luneta.dart';
import 'package:system/level%205/intramuros.dart';
import 'package:system/level%206/vigan.dart';
import 'package:system/level%207/magellan.dart';
import 'package:system/level%208/baguio.dart';
import 'package:system/level%209/taal.dart';

void main() => runApp(Load());

class Load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Load Game',
      theme: ThemeData(
        primaryColor: Colors.black54,
      ),
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
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: Text('Levels'),
      ),
      body: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: levels.map((level) {
              return GestureDetector(
                onTap: () {
                  navigateToLevel(context, level);
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                  ),
                  child: Center(
                    child: Text(
                      '$level',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void navigateToLevel(BuildContext context, int level) {
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
      );
    } else if (level == 11) {
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
      );
    } else if (level == 17) {
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
    } else if (level == 29) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cantabon()),
      );
    } else if (level == 30) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Burnham()),
      );
      // Add more conditions for other levels here
    }
  }
}
