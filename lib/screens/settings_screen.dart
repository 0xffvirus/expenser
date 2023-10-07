import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              "الاعدادات",
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
      body: const Center(
        child: Text(
          "تم التطوير من قبل بهاء\nGithub: @0xffvirus ",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              fontFamily: "Rudwa"),
        ),
      ),
    );
  }
}
