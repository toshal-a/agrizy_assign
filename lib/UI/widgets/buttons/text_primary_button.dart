import 'package:flutter/material.dart';
import 'package:tapinvest_assign/utils/colors.dart';

class TextPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String ctaTitle;
  final String textSubtitle;
  final String textTitle;
  const TextPrimaryButton({
    super.key,
    required this.onPressed,
    required this.ctaTitle,
    required this.textSubtitle,
    required this.textTitle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 21,
        left: 24,
        right: 20,
        bottom: 21,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            offset: Offset(0, -4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 1,
            offset: Offset(0, -1),
            spreadRadius: 0,
          )
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textTitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.40),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.80,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    textSubtitle,
                    style: const TextStyle(
                      color: Color(0xFF374151),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: onPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: ShapeDecoration(
                    color: ColorPalette.green600,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.20),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 1.80,
                        offset: Offset(0, 1.10),
                        spreadRadius: -0.30,
                      )
                    ],
                  ),
                  child: Text(
                    ctaTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
