import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:expenser/widget/DoTile.dart';
import 'package:flutter/material.dart';
import 'package:expenser/auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final _itemcontroller = TextEditingController();
  final _pricecontroller = TextEditingController();
  DataAuth db = DataAuth();
  final _mybox = Hive.box('mybox');
  @override
  void initState() {
    super.initState();
    if (_mybox.get('currentbalance') == null &&
        _mybox.get('currentgoal') == null &&
        _mybox.get('TODOLIST') == null &&
        _mybox.get("mainColor") == null) {
      db.CreateInitialData();
    } else {
      db.loadData();
    }
  }

  void createNewTask() {
    setState(() {
      showTextInputDialog(
        context: context,
        title: "اضافة مطلوب",
        message: 'الرجاء اضافة المعلومات التالية',
        okLabel: "تم",
        cancelLabel: "اغلاق",
        barrierDismissible: false,
        textFields: [
          const DialogTextField(
            hintText: 'المنتج',
          ),
          const DialogTextField(
            keyboardType: TextInputType.number,
            hintText: 'السعر',
          )
        ],
      ).then((value) {
        setState(() {
          _itemcontroller.text = value![0];
          _pricecontroller.text = value[1];
          saveNewTask();
        });
      });
    });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveInfoExchange(double value, bool increase, String time) {
    db.moneyExchange.add([value, increase, time]);
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList
          .add([_itemcontroller.text, false, int.parse(_pricecontroller.text)]);
      _itemcontroller.clear();
      _pricecontroller.clear();
    });
    db.updateData();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color(0xff5d74ef),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 5, top: 10),
            child: Text(
              "المطلوبات",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rudwa"),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffFAFAFA),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            taskprice: db.toDoList[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
