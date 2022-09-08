import 'package:bloc_learning/LoginProcess/Presentation/LoginCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonAndText extends StatelessWidget {
  const LoginButtonAndText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            context.read<LoginFormCubit>().submitted();
          },
          color: Colors.indigoAccent,
          minWidth: double.infinity,
          height: 40,
          child: const Text(
            'লগইন',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
