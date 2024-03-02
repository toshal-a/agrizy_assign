import 'package:flutter/material.dart';

class RotationWidget extends StatefulWidget {
  final Widget child;

  RotationWidget({Key? key, required this.child}) : super(key: key);

  @override
  _RotationWidgetState createState() => _RotationWidgetState();
}

class _RotationWidgetState extends State<RotationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Define the duration of one rotation cycle
      vsync: this,
    ); // Start the animation and repeat indefinitely
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        // Start the animation and repeat indefinitely after the delay
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed from the tree
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller, // Use the AnimationController for the rotation value
      child: widget.child, // Apply the rotation to the child widget
    );
  }
}
