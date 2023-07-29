import 'package:hive_flutter/hive_flutter.dart';

class DataAuth {
  late int currentbalance;
  late int currentgoal;
  List toDoList = [];
  List moneyExchange = [];
  final _mybox = Hive.box('mybox');
  void CreateInitialData() {
    toDoList = [
      ["Make Tutorial", false, 1000],
      ["Do Exercise", false, 999],
    ];
    currentbalance = 0;
    currentgoal = 0;
    moneyExchange = [];
  }

  void loadData() {
    currentbalance = _mybox.get("currentbalance");
    currentgoal = _mybox.get("currentgoal");
    toDoList = _mybox.get("TODOLIST");
    moneyExchange = _mybox.get("moneyExchange");
  }

  void updateData() {
    _mybox.put("currentbalance", currentbalance);
    _mybox.put("currentgoal", currentgoal);
    _mybox.put("TODOLIST", toDoList);
    _mybox.put("moneyExchange", moneyExchange);
  }
}
