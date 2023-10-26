import 'package:flutter/material.dart';

class TitleTemplate extends StatelessWidget {
  const TitleTemplate(
      {super.key,
      required this.title,
      required this.trailingText,
      required this.onTapFunc});

  final String title, trailingText;

  final void Function() onTapFunc;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: onTapFunc,
          child: Text(
            trailingText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
