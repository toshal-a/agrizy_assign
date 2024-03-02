import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapinvest_assign/utils/icons.dart';

class SwipeButton extends StatelessWidget {
  final String title;
  final String iconName;
  final String topRightText;
  final String topLeftText;
  final VoidCallback onSwipeComplete;

  const SwipeButton(
      {super.key,
      required this.onSwipeComplete,
      required this.title,
      required this.iconName,
      required this.topLeftText,
      required this.topRightText});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 25,
          right: 25,
          bottom: 24,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFFBFBF6),
          boxShadow: [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 0,
              offset: Offset(0, -0.50),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 4,
              offset: Offset(0, -4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  topLeftText,
                  style: TextStyle(
                    color: const Color(0xFF44403C).withOpacity(0.90),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  topRightText,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF44403C).withOpacity(0.90),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Stack(children: [
              Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE7E5E4),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFE4E4E7)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF1C1917),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.20,
                  ),
                ),
              ),
              SwipingButton(
                  iconName: iconName,
                  onPressed: onSwipeComplete,
              )
            ]),
          ],
        ),
      ),
    );
  }
}

class SwipingButton extends StatefulWidget {
  final String iconName;
  final VoidCallback onPressed;

  const SwipingButton({super.key, required this.iconName, required this.onPressed});

  @override
  State<SwipingButton> createState() => _SwipingButtonState();
}

class _SwipingButtonState extends State<SwipingButton> {
  double _width = 40; // Initial width of the widget

  void _updateWidth(DragUpdateDetails details) {
    setState(() {
      _width +=
          details.delta.dx; // Update the width based on the horizontal drag
      if (_width < 40) _width = 40; // Minimum width constraint
      if (_width > MediaQuery.of(context).size.width) {
        _width = MediaQuery.of(context).size.width; // Maximum width constraint
      }
    });
  }

  void _finalizeWidth(DragEndDetails details) {
      setState(() {
        if (_width < MediaQuery.of(context).size.width / 2) {
          _width = 40;
        } else {
          _width = MediaQuery.of(context).size.width;
          widget.onPressed();
          _width = 40;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _updateWidth,
      onHorizontalDragEnd: (DragEndDetails details) {
        _finalizeWidth(details);
      },
      // onHorizontalDragEnd: (),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 40,
          width: _width,
          decoration: ShapeDecoration(
            color: const Color(0xFF15803D),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          child: Align(
            alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                child: Icon(
                  icon(widget.iconName),
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ),
    );
  }
}
