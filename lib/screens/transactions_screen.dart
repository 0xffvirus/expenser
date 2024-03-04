import 'package:expenser/widget/log.dart';
import 'package:flutter/material.dart';
import 'package:expenser/auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransacrionsScreen extends StatefulWidget {
  const TransacrionsScreen({super.key});

  @override
  State<TransacrionsScreen> createState() => _TransacrionsScreenState();
}

class _TransacrionsScreenState extends State<TransacrionsScreen> {
  final _mybox = Hive.box('mybox');

  DataAuth db = DataAuth();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: false,
          title: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 5, top: 10),
              child: Text(
                "المعاملات",
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
          controller: ScrollController(),
          physics: const BouncingScrollPhysics(),
          itemCount: db.moneyExchange.length,
          itemBuilder: (context, index) {
            return InfoTale(
              amount: db.moneyExchange[(db.moneyExchange.length - 1) - index]
                  [0],
              increase: db.moneyExchange[(db.moneyExchange.length - 1) - index]
                  [1],
              time: db.moneyExchange[(db.moneyExchange.length - 1) - index][2],
              notes: db.moneyExchange[(db.moneyExchange.length - 1) - index][3],
            );
          },
        ));
  }
}
