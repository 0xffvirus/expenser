import 'package:expenser/screens/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:expenser/auth.dart';
import 'package:expenser/widget/DoTile.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveInfoExchange(double value, bool increase, String time) {
    db.moneyExchange.add([value, increase, time]);
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

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

  DataAuth db = DataAuth();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 5, top: 10),
            child: Text(
              "الرئيسية",
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
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xff5d74ef),
                borderRadius: BorderRadius.circular(12)),
            height: 150,
            width: 320,
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const TransacrionsScreen()));
                            },
                            icon: const Icon(
                              Icons.info,
                              color: Color.fromARGB(157, 250, 250, 250),
                            )),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            "الرصيد الحالي",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 19,
                                color: Color.fromARGB(157, 250, 250, 250),
                                fontFamily: "Rudwa"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "${db.currentbalance} SR",
                            style: const TextStyle(
                                fontSize: 30,
                                color: Color(0xfFfafafa),
                                fontFamily: "Rudwa"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "المتبقي",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xfFfafafa),
                                    fontFamily: "Rudwa"),
                              ),
                              Text(
                                "${(db.currentgoal - db.currentbalance) < 0 ? "اغلق" : db.currentgoal - db.currentbalance}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xfFfafafa),
                                ),
                              )
                            ],
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            color: Color.fromARGB(255, 132, 150, 253),
                            width: 20,
                          ),
                          Column(
                            children: [
                              const Text(
                                "الهدف",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xfFfafafa),
                                    fontFamily: "Rudwa"),
                              ),
                              Text(
                                "${db.currentgoal}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xfFfafafa),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  showTextInputDialog(
                    context: context,
                    title: "انقاص رصيد",
                    message: 'المبلغ',
                    okLabel: "تم",
                    cancelLabel: "اغلاق",
                    barrierDismissible: false,
                    textFields: [
                      const DialogTextField(
                        keyboardType: TextInputType.number,
                        hintText: '18',
                      )
                    ],
                  ).then((value) {
                    setState(() {
                      db.currentbalance -= int.parse(value![0]);
                      db.updateData();
                      saveInfoExchange(double.parse(value[0]), false,
                          DateFormat.yMMMMd().format(DateTime.now()));
                    });
                  });
                });
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: const Color(0xff5d74ef),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  FluentIcons.subtract_12_filled,
                  color: Color(0xfffafafa),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  showTextInputDialog(
                    context: context,
                    title: "حط هدف",
                    message: 'المبلغ',
                    okLabel: "تم",
                    cancelLabel: "اغلاق",
                    textFields: [
                      const DialogTextField(
                        keyboardType: TextInputType.number,
                        hintText: '1400',
                      )
                    ],
                  ).then((value) {
                    setState(() {
                      db.currentgoal = int.parse(value![0]);
                      db.updateData();
                    });
                  });
                });
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: const Color(0xff5d74ef),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  FluentIcons.target_arrow_16_filled,
                  color: Color(0xfffafafa),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  showTextInputDialog(
                    context: context,
                    title: "زيادة رصيد",
                    message: 'المبلغ',
                    okLabel: "تم",
                    cancelLabel: "اغلاق",
                    barrierDismissible: false,
                    textFields: [
                      const DialogTextField(
                        keyboardType: TextInputType.number,
                        hintText: '18',
                      )
                    ],
                  ).then((value) {
                    setState(() {
                      db.currentbalance += int.parse(value![0]);
                      db.updateData();
                      saveInfoExchange(double.parse(value[0]), true,
                          DateFormat.yMMMMd().format(DateTime.now()));
                    });
                  });
                });
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: const Color(0xff5d74ef),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  FluentIcons.add_24_filled,
                  color: Color(0xfffafafa),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "متطلبات",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rudwa"),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.toDoList.length >= 2
                ? 2
                : db.toDoList.length == 1
                    ? 1
                    : 0,
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
        )
      ]),
    );
  }
}
