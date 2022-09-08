import 'package:bloc_learning/entityValidation/PasswordFormFieldValidator.dart';
import 'package:bloc_learning/entityValidation/PhoneNumberValidatior.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  final PhoneNumberFromFieldValidation phoneNumber;
  final PasswordFormFieldValidation password;
  final FormzStatus status;
  final String errorMsg;
  final String response;

  const LoginState(
      {this.phoneNumber = const PhoneNumberFromFieldValidation.pure(),
      this.password = const PasswordFormFieldValidation.pure(),
      this.status = FormzStatus.pure,
      this.response = '',
      this.errorMsg = ''});

  LoginState copyWith(
      {PhoneNumberFromFieldValidation? phoneNumber,
      PasswordFormFieldValidation? password,
      FormzStatus? status,
      String? response,
      String? errorMsg}) {
    return LoginState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        status: status ?? this.status,
        response: response ?? this.response,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  List<Object> get props => [phoneNumber, password, status, errorMsg];
}
