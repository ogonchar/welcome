import 'package:flutter/material.dart';
import 'package:welcome/utils/constants.dart';

class TourTypeIndicator extends StatelessWidget {
  const TourTypeIndicator({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FilledButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              isSelected ? WColors.yellow : Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateProperty.all(
            BorderSide(
              color: isSelected ? WColors.yellow : Colors.white,
              width: 1,
            ),
          ),
        ),
        child: Text(title,
            style: TextStyle(color: isSelected ? WColors.grey : Colors.white)),
      ),
    );
  }
}
