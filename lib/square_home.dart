import 'package:flutter/material.dart';

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  Alignment alignment = Alignment.center; /// Initial alignment in the center
  bool animating = false; /// Tracks if the square is animating
  static const _squareSize = 50.0;

  void _moveRight() {
    setState(() {
      alignment = Alignment.centerRight;
      animating = true; /// Disable buttons during animation
    });
  }

  void _moveLeft() {
    setState(() {
      alignment = Alignment.centerLeft;
      animating = true; /// Disable buttons during animation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedAlign(
            alignment: alignment,
            duration: const Duration(seconds: 1),
            curve: Curves.bounceIn, //can use custom curve if needed 
            onEnd: () {
              setState(() {
                animating = false; /// Re-enable buttons after animation
              });
            },
            child: Container(
              width: _squareSize, // width of the square
              height: _squareSize, // height of the square
              decoration: BoxDecoration(
                  color: Colors.red, 
                  border: Border.all()),
            ),
          ),

          const SizedBox(height: 16), // spacing between the square and buttons

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: !animating && alignment != Alignment.centerRight
                    ? _moveRight
                    : null,
                child: const Text('Right'),
              ),

              const SizedBox(width: 8),

              ElevatedButton(
                onPressed: !animating && alignment != Alignment.centerLeft
                    ? _moveLeft
                    : null,
                child: const Text('Left'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
