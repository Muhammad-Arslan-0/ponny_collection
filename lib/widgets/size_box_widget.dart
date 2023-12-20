import 'package:flutter/material.dart';

class SizeBoxWidget extends StatelessWidget {
  final Widget child;
  const SizeBoxWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(height: 5), child],
    );
  }
}
