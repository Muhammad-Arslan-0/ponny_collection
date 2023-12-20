import 'package:flutter/material.dart';

class OrderDetailTile extends StatelessWidget {
  final String leading;
  final String title;
  final String trailing;
  const OrderDetailTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Text(leading, style: TextStyle(fontSize: 18)),
      title: Text(title, style: TextStyle(fontSize: 18)),
      trailing: Text(trailing, style: TextStyle(fontSize: 15)),
    );
  }
}
