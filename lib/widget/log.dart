import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoTale extends StatelessWidget {
  final double amount;
  final bool increase;
  final String time;
  const InfoTale(
      {super.key,
      required this.amount,
      required this.increase,
      required this.time});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            height: height * 0.09,
            width: width * 0.9,
            decoration: BoxDecoration(
                color: increase
                    ? Colors.green.withOpacity(0.25)
                    : Colors.red.withOpacity(0.25),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "${increase ? "+" : "-"}$amount SR",
                    style: TextStyle(
                        fontSize: 20,
                        color: increase
                            ? const Color(0xff00A538)
                            : const Color(0xffDA0000)),
                  ),
                ),
                Wrap(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            increase ? "اضافة مال" : "خسارة مال",
                            style: TextStyle(
                                fontSize: 23,
                                fontFamily: "Rudwa",
                                color: increase
                                    ? const Color(0xff00A538)
                                    : const Color(0xffDA0000)),
                          ),
                        ),
                        Text(time,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black45))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        "assets/icons/person.svg",
                        height: 40,
                        width: 40,
                        color: increase
                            ? const Color(0xff00A538)
                            : const Color(0xffDA0000),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
