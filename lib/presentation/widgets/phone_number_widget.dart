import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class BuildPhoneFormField extends StatelessWidget {
  final Function(String) onSaved; // إضافة هذا المتغير

  BuildPhoneFormField({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.lightGray),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: Text(
              '${generateCountryFlag()}+974',
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.blue),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: TextFormField(
                style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your phone number";
                  } else if (value.length < 7) {
                    return "Too short for a phone number";
                  }
                  return null;
                },
                onSaved: (value) {
                  onSaved(value!); // تمرير القيمة إلى Callback
                },
              ),
            )),
      ],
    );
  }

  String generateCountryFlag() {
    String countryCode = 'qa';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z ]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}
