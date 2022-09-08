import 'package:formz/formz.dart';

enum IsPasswordFormFieldValid { isInvalid }

class PasswordFormFieldValidation
    extends FormzInput<String, IsPasswordFormFieldValid> {
  const PasswordFormFieldValidation.pure([String value = '']) : super.pure(value);

  const PasswordFormFieldValidation.dirty([String value = ""])
      : super.dirty(value);

  @override
  IsPasswordFormFieldValid? validator(String value) {
    return value.isNotEmpty /*&&
            (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                .hasMatch(value))*/
        ? null
        : IsPasswordFormFieldValid.isInvalid;
  }
}
