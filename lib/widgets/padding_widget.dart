import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  final Widget child;
  const PaddingWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8), child: child);
  }
}
