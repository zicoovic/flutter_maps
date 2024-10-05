// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/cubit/maps/maps_cubit.dart';
import 'package:flutter_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_maps/data/repo/map_repo.dart';
import 'package:flutter_maps/data/web/places_web_services.dart';
import 'package:flutter_maps/presentation/screens/map_screen.dart';

import 'package:flutter_maps/presentation/screens/otp_screen.dart';

import 'constants/strings.dart';
import 'presentation/screens/login_screen.dart';

class AppRoutes {
  PhoneAuthCubit? phoneAuthCubit;
  AppRoutes() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );
      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
      case mapScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MapsCubit(
              MapRepo(
                placesWebServices: PlacesWebServices(),
              ),
            ),
            child: const MapScreen(),
          ),
        );
    }
  }
}
