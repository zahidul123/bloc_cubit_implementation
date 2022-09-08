import 'package:formz/formz.dart';

enum IsNumberTypeInputFieldValid { IsInvalid }

class NumberInputFieldValidation
    extends FormzInput<String, IsNumberTypeInputFieldValid> {
  const NumberInputFieldValidation.pure([String value = '']) : super.pure(value);

  const NumberInputFieldValidation.dirty([String value = ""])
      : super.dirty(value);

  @override
  IsNumberTypeInputFieldValid? validator(String value) {
    return value.isNotEmpty
        ? checkFieldNumberFormation(value)
            ? null
            : IsNumberTypeInputFieldValid.IsInvalid
        : IsNumberTypeInputFieldValid.IsInvalid;
  }

  checkFieldNumberFormation(String value) {
    var reg = RegExp(r'^-?[0-9]+$');
    return reg.hasMatch(value);
  }
}
