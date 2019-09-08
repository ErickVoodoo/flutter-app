import 'dart:math';
import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

List<List<String>> gradients = [
  ['#536976', '#292E49'],
  ['#2b5876', '#4e4376'],
  ['#16222A', '#3A6073'],
  ['#1F1C2C', '#928DAB'],
  ['#232526', '#414345'],
  ['#485563', '#29323c'],
];

List<Color> getGradient() {
  final random = new Random();
  List<String> colors = gradients[random.nextInt(gradients.length)];
  return colors.map((v) => hexToColor(v)).toList();
}