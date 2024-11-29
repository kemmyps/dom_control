import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../pages/myTheme.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required String labelText,
  required String validatorMessage,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: labelText),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return validatorMessage;
      }
      return null;
    },
  );
}

Widget buildPhoneNumberFormField({
  required TextEditingController controller,
  required String labelText,
  required String validatorMessage,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: labelText),
    keyboardType: TextInputType.phone,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return validatorMessage;
      }
      return null;
    },
  );
}

Widget buildDatePickerRow({
  required BuildContext context,
  required DateTime? selectedDate,
  required String dateLabelText,
  required Function(DateTime) onDateSelected,
}) {
  return Row(
    children: [
      Expanded(
        child: TextFormField(
          controller: TextEditingController(
            text: selectedDate != null
                ? DateFormat('dd/MM/yyyy').format(selectedDate)
                : '',
          ),
          decoration: MyTheme.dateInputDecoration(dateLabelText),
          readOnly: true,
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(1940),
              lastDate: DateTime.now(),
            );
            if (picked != null && picked != selectedDate) {
              onDateSelected(picked);
            }
          },
        ),
      ),
      IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(1940),
            lastDate: DateTime.now(),
          );
          if (picked != null && picked != selectedDate) {
            onDateSelected(picked);
          }
        },
      ),
    ],
  );
}