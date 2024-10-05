import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'package:flutter_maps/presentation/widgets/show_progress_indicator.dart';

class BuildPhoneVerificationBloc extends StatelessWidget {
  const BuildPhoneVerificationBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        }

        if (state is PhoneOTPVerified) {
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(mapScreen);
        }

        if (state is PhoneAuthFailed) {
          // Navigator.pop(context);
          String errorMessage = (state).errorMessage;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 5)));
        }
      },
      child: Container(),
    );
  }
}
