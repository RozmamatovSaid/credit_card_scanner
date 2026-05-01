import 'package:flutter/material.dart';

extension SizedboxExtensionI on int {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension SizedboxExtensionD on double {
  SizedBox get height => SizedBox(height: this);
  SizedBox get width => SizedBox(width: this);
}
