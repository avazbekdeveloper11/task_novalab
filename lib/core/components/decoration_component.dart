import 'package:flutter/material.dart';

class DecoComponents {
  static BoxDecoration radiusBottomAndImage({required String image}) {
    return BoxDecoration(
      color: Colors.blue,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    );
  }
}
