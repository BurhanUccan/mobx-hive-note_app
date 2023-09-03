// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../assets/theme/custom_theme.dart';

class GeneralText extends StatelessWidget {
  final String text;
  final double size;
  final bool isBold;

  const GeneralText({
    super.key,
    required this.text,
    required this.size,
    required this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: GoogleFonts.oxygen(
          fontSize: size,
          color: myDarkTheme.colorScheme.secondary,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
