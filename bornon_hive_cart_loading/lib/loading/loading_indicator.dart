import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(
          top: 150.0, bottom: 150.0, left: 10.0, right: 10.0),
      child: LiquidCircularProgressIndicator(
        value: 0.25, // Defaults to 0.5.
        valueColor: AlwaysStoppedAnimation(Color.fromARGB(
            255, 51, 209, 3)), // Defaults to the current Theme's accentColor.
        backgroundColor:
            Colors.white, // Defaults to the current Theme's backgroundColor.
        borderColor: Color.fromARGB(255, 243, 38, 182),
        borderWidth: 5.0,
        direction: Axis
            .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
        center: AnimatedTextKit(
          animatedTexts: [
            ScaleAnimatedText("Show loading...",
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "MonteCarlo",
                  color: Color.fromARGB(255, 3, 143, 66),
                )),
          ],
        ),
      ),
    ));
  }
}
