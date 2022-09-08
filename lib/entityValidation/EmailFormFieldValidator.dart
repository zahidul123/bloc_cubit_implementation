import 'package:formz/formz.dart';

enum IsEmailFormFieldValid { isInvalid }

class EmailFormFieldValidation
    extends FormzInput<String, IsEmailFormFieldValid> {
  const EmailFormFieldValidation.pure([String value = '']) : super.pure(value);

  const EmailFormFieldValidation.dirty([String value = ""])
      : super.dirty(value);

  @override
  IsEmailFormFieldValid? validator(String value) {
    return value.isNotEmpty &&
            (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value))
        ? null
        : IsEmailFormFieldValid.isInvalid;
  }
}
