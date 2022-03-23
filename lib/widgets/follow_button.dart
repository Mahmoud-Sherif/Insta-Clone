import 'package:chat_app/core/responsive/screan_size.dart';
import 'package:flutter/material.dart';

class FollowButtonWid extends StatelessWidget {
  final Function()? function;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  const FollowButtonWid(
      {Key? key,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.textColor,
      this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: TextButton(
        onPressed: function,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          width: sizeFromWidth(context, 1.8),
          height: 27,
        ),
      ),
    );
  }
}
