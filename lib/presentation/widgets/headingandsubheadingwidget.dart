import 'package:flutter/material.dart';

class headingandsubheadwidget extends StatelessWidget {
  final double? heightSize;
  final String? heading;
  final String? subheading;
  const headingandsubheadwidget({
    super.key,
    this.heightSize,
    this.heading,
    this.subheading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: heightSize,
        ),
        Text(
          "$heading",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: subheading!.isNotEmpty ? heightSize : 0,
        ),
        subheading!.isNotEmpty
            ? Text(
                "$subheading",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            : SizedBox()
      ],
    );
  }
}
