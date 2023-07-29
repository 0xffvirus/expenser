import 'package:flutter/material.dart';
import 'package:expenser/auth.dart';

DataAuth db = DataAuth();
InkWell SelectColor(Color color) {
  return InkWell(
    onTap: () {},
    child: ClipOval(
      child: Container(
        height: 30,
        width: 30,
        color: color,
      ),
    ),
  );
}
