import 'package:formz/formz.dart';

enum IsOnlyTextFormFieldValid { isInvalid }

class OnlyTextFromFieldValidation
    extends FormzInput<String, IsOnlyTextFormFieldValid> {
  const OnlyTextFromFieldValidation.pure([String value = '']) : super.pure(value);

  const OnlyTextFromFieldValidation.dirty([String value = ""])
      : super.dirty(value);

  @override
  IsOnlyTextFormFieldValid? validator(String value) {
    return value.isNotEmpty ? null : IsOnlyTextFormFieldValid.isInvalid;
  }
}
