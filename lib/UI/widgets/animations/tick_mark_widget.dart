import 'package:flutter/material.dart';
import 'package:tapinvest_assign/utils/colors.dart';

class TickMarkAnimationWidget extends StatefulWidget {
  final AnimationController? animationController;

  const TickMarkAnimationWidget(
      {super.key, this.animationController}
  );

  @override
  _TickMarkAnimationWidgetState createState() => _TickMarkAnimationWidgetState();
}

class _TickMarkAnimationWidgetState extends State<TickMarkAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _animationController = widget.animationController != null ? widget.animationController! : AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Duration of the animation
    ) ;

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {}); // Trigger rebuild with updated animation value
      });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        // Start the animation and repeat indefinitely after the delay
        _animationController.forward();
      }
    });
     // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose controller when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CustomPaint(
            painter: TickMarkPainter(
                progress: _animation.value,
            ),
            child: const SizedBox(height:  20, width:  20),// Size of the canvas for the tick mark
          ),
        ),
      ),
    );
  }
}

class TickMarkPainter extends CustomPainter {
  final double progress;

  TickMarkPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorPalette.green700 // Color of the tick mark
      ..strokeWidth = 3.0 // Adjusted stroke width for smaller size
      ..style = PaintingStyle.stroke;

    // Adjusted points for the smaller size
    final startFirstLine = Offset(size.width * 0.0, size.height * 0.5);
    final endFirstLine = Offset(size.width * 0.3, size.height);
    final endSecondLine = Offset(size.width * 0.75, size.height * 0.0);

    Path path = Path();
    path.moveTo(startFirstLine.dx, startFirstLine.dy);
    path.lineTo(
      startFirstLine.dx + (endFirstLine.dx - startFirstLine.dx) * progress,
      startFirstLine.dy + (endFirstLine.dy - startFirstLine.dy) * progress,
    );

    if (progress > 0.5) {
      double secondLineProgress = (progress - 0.5) * 2;
      path.moveTo(endFirstLine.dx, endFirstLine.dy);
      path.lineTo(
        endFirstLine.dx + (endSecondLine.dx - endFirstLine.dx) * secondLineProgress,
        endFirstLine.dy + (endSecondLine.dy - endFirstLine.dy) * secondLineProgress,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

