// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:flutter_maps/constants/my_colors.dart';

// ignore: must_be_immutable
class BuildPinCodeFields extends StatelessWidget {
  // late String otpCode;

  void Function(String) onCompleted;
  BuildPinCodeFields({
    super.key,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: MyColors.blue,
          inactiveColor: MyColors.blue,
          inactiveFillColor: Colors.white,
          selectedColor: MyColors.blue,
          selectedFillColor: Colors.white,
          activeFillColor: MyColors.blue,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: onCompleted,
        onChanged: (value) {
          // print(value);
        },
      ),
    );
  }
}
