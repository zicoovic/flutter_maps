import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/presentation/widgets/button_widget.dart';
import 'package:flutter_maps/presentation/widgets/show_progress_indicator.dart';

import '../widgets/build_intro_text_widget.dart';
import '../widgets/phone_number_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  late String phoneNumber;

  Future<void> _register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      _phoneFormKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _phoneFormKey,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BuildIntroTexts(
                    phoneNumber: 'What is your phone number?',
                    message:
                        'Please Enter your phone number to verify your account',
                  ),
                  const SizedBox(height: 110),
                  BuildPhoneFormField(
                    onSaved: (value) {
                      phoneNumber = value; // حفظ القيمة المدخلة في phoneNumber
                    },
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomButton(
                      onPressed: () {
                        showProgressIndicator(context);
                        _register(context);
                      },
                      text: 'Register',
                    ),
                  ),
                  const BuildPhoneNumberSubmittedBloc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
