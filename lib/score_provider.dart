import 'package:flutter/foundation.dart';

class ScoreProvider with ChangeNotifier {
  int _score = 0;

  int get score => _score;

  void incrementScore() {
    _score++;
    notifyListeners();
  }
}
