import 'dart:ui';
import 'package:flutter/material.dart';

/// Read and manipulate the size of the screen
class ScreenSizeService extends ChangeNotifier {
  final Size physicalScreenSize = window.physicalSize;
  final WindowPadding padding = window.padding;
  final double pixelRatio = window.devicePixelRatio;

  late Size logicalScreenSize;
  late double physicalWidth;
  late double physicalHeight;
  late double logicalWidth;
  late double logicalHeight;
  late double paddingLeft;
  late double paddingRight;
  late double paddingTop;
  late double paddingBottom;
  late double safeWidth;
  late double safeHeight;

  ScreenSizeService() {
    initialise();
  }

  void initialise() {
    physicalWidth = physicalScreenSize.width;
    physicalHeight = physicalScreenSize.height;
    logicalScreenSize = window.physicalSize / pixelRatio;
    logicalWidth = logicalScreenSize.width;
    logicalHeight = logicalScreenSize.height;
    paddingLeft = window.padding.left / window.devicePixelRatio;
    paddingRight = window.padding.right / window.devicePixelRatio;
    paddingTop = window.padding.top / window.devicePixelRatio;
    paddingBottom = window.padding.bottom / window.devicePixelRatio;
  }

  void setTransparent(bool isTransparent) {
    throw Exception("Not implemented!");
  }
}
