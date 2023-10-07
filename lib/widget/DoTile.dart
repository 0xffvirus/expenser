import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final int taskprice;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.taskprice,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 35),
          child: Text(
            "$taskprice",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NumFamily",
              color: taskCompleted
                  ? Colors.green.withOpacity(0.75)
                  : Colors.red.withOpacity(0.75),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
          child: Stack(
            children: [
              Slidable(
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: deleteFunction,
                      icon: Icons.delete,
                      backgroundColor: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(12),
                    )
                  ],
                ),
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: taskCompleted
                          ? Colors.green.withOpacity(0.25)
                          : Colors.red.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // checkbox
                            Checkbox(
                              value: taskCompleted,
                              onChanged: onChanged,
                              activeColor: Colors.black,
                            ),

                            // task name
                            Text(
                              taskName,
                              style: TextStyle(
                                fontFamily: "Rudwa",
                                fontSize: 20,
                                decoration: taskCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
