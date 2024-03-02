import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:tapinvest_assign/UI/widgets/animations/rotation_widget.dart';
import 'package:tapinvest_assign/UI/widgets/animations/tick_mark_widget.dart';
import 'package:tapinvest_assign/utils/colors.dart';
import 'package:tapinvest_assign/utils/icons.dart';

class PurchaseConfirmationScreen extends StatefulWidget {
  const PurchaseConfirmationScreen({super.key});

  @override
  State<PurchaseConfirmationScreen> createState() => _PurchaseConfirmationScreenState();
}

class _PurchaseConfirmationScreenState extends State<PurchaseConfirmationScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Duration of the animation
    ) ;

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {}); // Trigger rebuild with updated animation value
      });

    Future.delayed(const Duration(seconds: 1), () {
      // Ensure the widget is still mounted before playing the animation
      if (mounted) {
        _animationController.forward();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: ColorPalette.green700,
              //alignment: Alignment.,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: ScaleTransition(
                    scale: _animation,
                    child: SizedBox(
                      width: 111,
                      height: 111,
                      child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF116631),
                        borderRadius: BorderRadius.circular(15)
                      ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0, right: 0, top: 0, bottom: 0,
                              child: RotationWidget(
                                child: Icon(
                                  icon('tickmark_back'),
                                  color: Colors.white,
                                  size: 48
                                ),
                              ),
                            ),
                            const TickMarkAnimationWidget()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Lottie.asset(
                "assets/confirmation.json",
                frameRate: const FrameRate(60),
            ),
          )
        ],
      ),
    );
  }
}


