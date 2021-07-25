import 'dart:ui';

import 'package:challenge/presentation/core/colors.dart';
import 'package:flutter/material.dart'
    show EdgeInsets, SizedBox, BoxDecoration, BorderRadius;

class SignInStyles {
  static const double loadingWidgetHeight = 5;
  final animationDuration = const Duration(milliseconds: 250);
  final double appBarHeight = 200;
  final double buttonHeight = 60;
  final double fullOpacity = 1;
  final double halfOpacity = 0.5;
  final double loadingWidgetsdistance = 10;
  final double horizontalPadding = 70;
  final Size appBarSize = const Size.fromHeight(150);
  final EdgeInsets formPadding =
      const EdgeInsets.only(left: 35, right: 35, top: 40);
  final constHeight = const SizedBox(height: 30);
  final buttonDecoration = BoxDecoration(
      color: AppColors.blueGrey, borderRadius: BorderRadius.circular(100));
  final animatiedBoxDecoration = BoxDecoration(
      color: AppColors.orangeRed, borderRadius: BorderRadius.circular(100));
}
