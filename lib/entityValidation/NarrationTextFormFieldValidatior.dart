import 'package:formz/formz.dart';

enum IsNarrationTextFormFieldValid { isInvalid }

class NarrationTextFieldFormValidation
    extends FormzInput<String, IsNarrationTextFormFieldValid> {
  const NarrationTextFieldFormValidation.pure([String value = '']) : super.pure(value);

  const NarrationTextFieldFormValidation.dirty([String value = ""])
      : super.dirty(value);

  @override
  IsNarrationTextFormFieldValid? validator(String value) {
    return value.isNotEmpty && (RegExp(r'^[A-Za-z0-9 _]+$').hasMatch(value))
        ? null
        : IsNarrationTextFormFieldValid.isInvalid;
  }
}
