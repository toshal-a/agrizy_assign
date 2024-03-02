import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String prefixSymbol;
  final TextEditingController controller =  TextEditingController();

  CustomTextFieldWidget({super.key,
    required this.labelText,
    required this.prefixSymbol,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none, // Removes underline
              labelText: labelText,
              prefixIcon: Text(
                prefixSymbol,
                style: const TextStyle(
                  color: Color(0xFFA8A29E),
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ), // Icon at the beginning of the text field
              // Customizing the appearance further if needed
              labelStyle: const TextStyle(
                color: Color(0xFFA8A29E),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0.06,
              ), // Color of the label text
            ),
          ),
        ),
      ],
    );
  }
}

