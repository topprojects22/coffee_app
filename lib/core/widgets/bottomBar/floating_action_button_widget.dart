import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClipOval(
      child: Material(
        color: Color(0xFF7861FF),
        elevation: 10,
        child: InkWell(
          child: SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              CupertinoIcons.add_circled,
              size: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
