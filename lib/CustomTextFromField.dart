import 'package:bloc_learning/LoginProcess/Presentation/LoginCubit.dart';
import 'package:bloc_learning/LoginProcess/Presentation/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDynamicWidget extends StatelessWidget {
  const CustomDynamicWidget(
      {Key? key,
      required this.hintText,
      required this.errorText,
      required this.labelText,
      required this.prefixIcons,
      required this.textInputType,
      this.outLineEnableBorderColor = Colors.indigo,
      this.outLineFocusedBorderColor = Colors.black45,
      required this.fieldType,
      required this.focusNode,
      //this.onChanged,
      // this.validator,
      // this.inputFormatters,
      this.fieldLength = 12347689})
      : super(key: key);

  final String hintText;
  final String labelText;
  final IconData prefixIcons;
  final Color outLineEnableBorderColor;
  final Color outLineFocusedBorderColor;

  //final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final TextInputType textInputType;
  final String fieldType;

  // final Function(String?)? onChanged;
  //final String? Function(String?)? validator;
  final int? fieldLength;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormCubit, LoginState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          onChanged: (value) {
            switch (fieldType) {
              case 'phone':
                context.read<LoginFormCubit>().onPhoneNumberFieldFocused(value);
                break;
              default:
                context.read<LoginFormCubit>().onPasswordFieldFocused(value);
            }
          },
          focusNode: focusNode,
          //   validator: validator,
          keyboardType: textInputType,
          //   inputFormatters: inputFormatters,
          maxLength: fieldLength,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(prefixIcons),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: outLineEnableBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: outLineFocusedBorderColor),
              ),
              errorStyle: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              hintText: hintText,
              labelText: labelText,
              errorText: fieldType == 'phone'
                  ? state.password.invalid
                      ? errorText
                      : null
                  : state.phoneNumber.invalid
                      ? errorText
                      : null),
        ),
      );
    });
  }
}
