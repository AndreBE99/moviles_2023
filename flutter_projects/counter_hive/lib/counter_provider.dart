import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;
  int get getCounter => _counter;
  bool switchVal = false;

  incrementCounter() {
    _counter++;
    notifyListeners();
  }

  saveCounter() async {
    var box = await Hive.openBox<int>("contadores");
    var box2 = await Hive.openBox<bool>("switches");
    box.put("numero", _counter);
    box2.put("switch", switchVal);

    notifyListeners();
  }

  loadCounter() async {
    var box = await Hive.openBox<int>("contadores");
    var box2 = await Hive.openBox<bool>("switches");
    _counter = box.get("numero") ?? 0;
    switchVal = box2.get("switch") ?? false;

    notifyListeners();
  }

  setSwitch(bool value) {
    switchVal = value;
    notifyListeners();
  }
}
