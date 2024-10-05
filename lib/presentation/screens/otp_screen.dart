import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:flutter_maps/presentation/widgets/build_phone_verification_bloc.dart';

import '../widgets/build_intro_text_widget.dart';

import '../widgets/build_pin_code_fields.dart';
import '../widgets/button_widget.dart';
import '../widgets/show_progress_indicator.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.phoneNumber});
  final phoneNumber;

  late String otpCode;

  void _login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BuildIntroTexts(
                      phoneNumber: 'Verify your phone number',
                      message: '',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text.rich(TextSpan(
                      text: 'Enter your 6 digit code numbers sent to',
                      style: TextStyle(
                          color: Colors.black, fontSize: 18, height: 1.4),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' phoneNumber',
                            style: TextStyle(color: MyColors.blue)),
                      ],
                    )),
                    const SizedBox(height: 110),
                    BuildPinCodeFields(onCompleted: (value) {
                      otpCode = value;
                      print(otpCode);
                    }),
                    const SizedBox(height: 60),
                    CustomButton(
                      onPressed: () {
                        showProgressIndicator(context);
                        _login(context);
                      },
                      text: 'verify',
                    ),
                    const BuildPhoneVerificationBloc(),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
