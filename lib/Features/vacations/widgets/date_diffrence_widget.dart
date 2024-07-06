import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:easy_hr/Core/widgets/custom_text_form_field.dart';

class DateDiffrenceWidget extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;

  const DateDiffrenceWidget({super.key, required this.onDateSelected});

  @override
  State<DateDiffrenceWidget> createState() => _DateDiffrenceWidgetState();
}

class _DateDiffrenceWidgetState extends State<DateDiffrenceWidget> {
  TextEditingController dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()));
  DateTime? selectedDate = DateTime.now();

  Future<DateTime?> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate!,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    return pickedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextFormField(
        suffixIcon: Icons.calendar_today_outlined,
        labelText: dateController.text,
        isContentBold: true,
        controller: dateController,
        readOnly: true,
        centerContent: true,
        onTap: () async {
          selectedDate = await pickDate();
          if (selectedDate != null) {
            setState(() {
              dateController.text =
                  DateFormat('dd/MM/yyyy').format(selectedDate!);
              widget.onDateSelected(selectedDate!);
            });
          }
        },
      ),
    );
  }
}
