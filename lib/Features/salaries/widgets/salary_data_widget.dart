import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/widgets/text_builder.dart';

class SalaryDataWidget extends StatelessWidget {
  String text;
  String value;
  String text2;
  String value2;

  SalaryDataWidget({
    super.key,
    required this.text,
    required this.value,
    required this.text2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Card(
            shadowColor: Colors.black,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextBuilder(
                    "$text :",
                  ),
                  Expanded(
                    child: Center(
                      child: TextBuilder(
                        value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            shadowColor: Colors.black,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextBuilder(
                    "$text2 :",
                  ),
                  Expanded(
                    child: Center(
                      child: TextBuilder(
                        value2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
