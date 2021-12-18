import 'package:flutter/material.dart';

class BottomListTile extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final int? fieldId;

  const BottomListTile({
    required this.title,
    required this.callback,
    this.fieldId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        child: Chip(
          backgroundColor: Colors.grey.shade100,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          label: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          elevation: 1,
          side: BorderSide(color: Colors.blue.shade600),
        ),
        onTap: callback,
      ),
    );
  }
}
