import 'package:formz/formz.dart';

enum IsPhoneNumberFromFieldValid { isInvalid }

class PhoneNumberFromFieldValidation
    extends FormzInput<String, IsPhoneNumberFromFieldValid> {
  const PhoneNumberFromFieldValidation.pure([String value = '']) : super.pure(value);

  const PhoneNumberFromFieldValidation.dirty([String value = ""])
      : super.dirty(value);

  @override
  IsPhoneNumberFromFieldValid? validator(String value) {
    return value.isNotEmpty /*&& checkIsPhoneNumberValid(value)*/
        ? null
        : IsPhoneNumberFromFieldValid.isInvalid;
  }

  bool checkIsPhoneNumberValid(String value) {
    var reg = RegExp(r'^((\01))[3-9]{1}(\d){8}');
    return reg.hasMatch(value);
  }
}
