import 'package:flutter/material.dart';

import 'text/customTextWidget.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  const CustomTextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(20), // Oval şekli sağlayan border yarıçapı
        border: Border.all(
          color: Colors.white, // Beyaz renkli çerçeve
          width: 1.2, // Çerçeve kalınlığı
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: CustomText(
              color: Colors.white,
              isBold: false,
              size: 18,
              text: text,
            ),
          ),
        ),
      ),
    );
  }
}
