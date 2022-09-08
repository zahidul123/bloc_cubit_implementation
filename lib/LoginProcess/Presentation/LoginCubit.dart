import 'package:bloc_learning/LoginProcess/Presentation/LoginState.dart';
import 'package:bloc_learning/entityValidation/PasswordFormFieldValidator.dart';
import 'package:bloc_learning/entityValidation/PhoneNumberValidatior.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginFormCubit extends Cubit<LoginState> {
  LoginFormCubit() : super(const LoginState());

  void onPhoneNumberFieldFocused(String phoneNumber) {
    final focusedPhoneNumber =
        PhoneNumberFromFieldValidation.dirty(phoneNumber);
    emit(state.copyWith(
        phoneNumber: focusedPhoneNumber.valid
            ? focusedPhoneNumber
            : PhoneNumberFromFieldValidation.pure(phoneNumber),
        status: Formz.validate([state.password, focusedPhoneNumber])));
  }

  void onPhoneNumberFormFieldUnfocused() {
    final phoneNumber =
        PhoneNumberFromFieldValidation.dirty(state.phoneNumber.value);
    emit(state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate([phoneNumber, state.password])));
  }

  void onPasswordFieldFocused(String password) {
    final focusedPassword = PasswordFormFieldValidation.dirty(password);
    emit(state.copyWith(
        password: focusedPassword.valid
            ? focusedPassword
            : PasswordFormFieldValidation.pure(password),
        status: Formz.validate([state.phoneNumber, focusedPassword])));
  }

  void onPasswordFormFieldUnfocused() {
    final password = PasswordFormFieldValidation.dirty(state.password.value);
    emit(state.copyWith(
        password: password,
        status: Formz.validate([password, state.phoneNumber])));
  }

  void submitted() async {
    final phoneNumber =
        PhoneNumberFromFieldValidation.dirty(state.phoneNumber.value);
    final password = PasswordFormFieldValidation.dirty(state.password.value);
    emit(state.copyWith(
        password: password,
        phoneNumber: phoneNumber,
        status: Formz.validate([phoneNumber, password])));

    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        var response = "Login Success";
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, response: response));
      } catch (e) {
        final error = e.toString();
        emit(state.copyWith(
            status: FormzStatus.submissionFailure, errorMsg: error));
      }
    }
  }
}
