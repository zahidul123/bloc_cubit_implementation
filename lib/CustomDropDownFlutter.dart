import 'package:flutter/material.dart';

class CustomDropdownFlutter<T,QB,ST> extends StatelessWidget {
  const CustomDropdownFlutter(
      {Key? key,
      required this.hintText,
      required this.options,
      required this.firstItemValue,
      required this.getLabel,
      this.onChanged,
      required this.outLineEnableBorderColor,
      required this.outLineFocusedBorderColor})
      : super(key: key);

  final String hintText;
  final List<T> options;
  final T firstItemValue;
  final String Function(T) getLabel;
  final void Function(T?)? onChanged;
  final Color outLineEnableBorderColor;
  final Color outLineFocusedBorderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: FormField<T>(
          builder: (FormFieldState<T> state) {
            return InputDecorator(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: outLineEnableBorderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: outLineFocusedBorderColor),
                ),
              ),
              isEmpty: firstItemValue == null || firstItemValue == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  isExpanded: true,
                  elevation: 10,
                  value: firstItemValue,
                  isDense: true,
                  onChanged: onChanged,
                  items: options.map((T value) {
                    return DropdownMenuItem<T>(
                      value: value,
                      child: Flexible(child: Text(getLabel(value))),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ));
  }
}
