import 'package:flutter/material.dart';
import 'package:welcome/utils/constants.dart';

class GridViewBackground extends StatelessWidget {
  const GridViewBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 305,
      child: Stack(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  WColors.gradientThirdColor.withOpacity(0.5),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(21),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            child: Container(
              height: 178,
              width: 116,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.gridBackgound),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
