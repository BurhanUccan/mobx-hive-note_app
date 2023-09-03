import 'package:flutter/material.dart';

import '../assets/theme/custom_theme.dart';

class customDivider extends StatelessWidget {
  const customDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Divider(
        thickness: .8,
        color: myDarkTheme.colorScheme.secondary,
      ),
    );
  }
}
