import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class InfoTale extends StatefulWidget {
  final double amount;
  final bool increase;
  final String time;
  final String notes;
  const InfoTale(
      {super.key,
      required this.amount,
      required this.increase,
      required this.time,
      required this.notes});

  @override
  State<InfoTale> createState() => _InfoTaleState();
}

class _InfoTaleState extends State<InfoTale> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: AnimatedContainer(
              height: selected ? height * 0.20 : height * 0.09,
              width: width * 0.9,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                  color: widget.increase
                      ? Colors.green.withOpacity(0.25)
                      : Colors.red.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(15)),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "${widget.increase ? "+" : "-"}${widget.amount} SR",
                            style: TextStyle(
                                fontSize: 20,
                                color: widget.increase
                                    ? const Color(0xff00A538)
                                    : const Color(0xffDA0000)),
                          ),
                        ),
                        Wrap(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    widget.increase ? "اضافة مال" : "خسارة مال",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontFamily: "Rudwa",
                                        color: widget.increase
                                            ? const Color(0xff00A538)
                                            : const Color(0xffDA0000)),
                                  ),
                                ),
                                Text(widget.time,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black45))
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset(
                                "assets/icons/person.svg",
                                height: 40,
                                width: 40,
                                color: widget.increase
                                    ? const Color(0xff00A538)
                                    : const Color(0xffDA0000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedOpacity(
                        // If the widget is visible, animate to 0.0 (invisible).
                        // If the widget is hidden, animate to 1.0 (fully visible).
                        opacity: selected ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 250),
                        // The green box must be a child of the AnimatedOpacity widget.
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "ملاحظات: \n${widget.notes}",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Rudwa",
                              ),
                            ))),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
