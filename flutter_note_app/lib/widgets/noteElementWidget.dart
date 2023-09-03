import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text/customTextWidget.dart';
import 'text/generalTextWidget.dart';
import '../assets/theme/custom_theme.dart';
import 'dividerWidget.dart';

class NoteElement extends StatelessWidget {
  final String header;
  final String note;
  final String num;
  final VoidCallback onTap;
  const NoteElement(
      {super.key,
      required this.header,
      required this.note,
      required this.num,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: num + "/",
                  size: 15,
                  isBold: false,
                  color: myDarkTheme.colorScheme.onSecondary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width.w,
                                    child: GeneralText(
                                        text: header, size: 35, isBold: false),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.arrow_outward,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: CustomText(
                color: myDarkTheme.colorScheme.onSecondary,
                text: note,
                size: 15,
                isBold: false),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
