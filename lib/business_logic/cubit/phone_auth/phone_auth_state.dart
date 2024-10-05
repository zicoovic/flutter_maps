part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhoneAuthLoading extends PhoneAuthState {}

final class PhoneAuthSubmitted extends PhoneAuthState {}

final class PhoneOTPVerified extends PhoneAuthState {}

final class PhoneAuthFailed extends PhoneAuthState {
  final String errorMessage;
  PhoneAuthFailed({required this.errorMessage});
}
