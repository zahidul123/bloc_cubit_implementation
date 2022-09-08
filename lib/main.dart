import 'package:bloc_learning/CustomDropDownFlutter.dart';
import 'package:bloc_learning/CustomTextFromField.dart';
import 'package:bloc_learning/LoginButton.dart';
import 'package:bloc_learning/LoginProcess/Presentation/LoginCubit.dart';
import 'package:bloc_learning/LoginProcess/Presentation/LoginState.dart';
import 'package:bloc_learning/modelClass/UserModelClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'LoaderDialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _phoneNumberFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  List<UserDetails> userDetails = [];

  @override
  void initState() {
    super.initState();
    _phoneNumberFocusNode.addListener(() {
      if (!_phoneNumberFocusNode.hasFocus) {
        context.read<LoginFormCubit>().onPhoneNumberFormFieldUnfocused();
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<LoginFormCubit>().onPasswordFormFieldUnfocused();
      }
    });
    addUserDetails();
  }

  @override
  void dispose() {
    _phoneNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormCubit(),
      child: BlocListener<LoginFormCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionInProgress) {
            showDialog(context: context, builder: (context) => LoaderDialog());
          } else if (state.status.isSubmissionSuccess) {
            var value = state.response;

            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(value)),
              );
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => DashBoardScreen()));
          } else if (state.status.isSubmissionFailure) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(state.errorMsg)),
              );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Flexible(
                  child: CustomDropdownFlutter(
                      hintText: "select user",
                      options: userDetails,
                      firstItemValue: userDetails[0],
                      onChanged: (value) {
                        var myValue = value as UserDetails;
                        print(myValue.user_name);
                      },
                      getLabel: (value) {
                        var myDetails = value as UserDetails;
                        return myDetails
                            .toString() /*"${myDetails.user_name} - ${myDetails.user_acc_no}"*/;
                      },
                      outLineEnableBorderColor: Colors.green,
                      outLineFocusedBorderColor: Colors.red)),
              Flexible(
                  child: CustomDynamicWidget(
                hintText: "Phone",
                errorText: "Please enter your phone",
                labelText: "Phone Address",
                prefixIcons: Icons.email,
                fieldType: "phone",
                textInputType: TextInputType.phone,
                focusNode: _phoneNumberFocusNode,
              )),
              Flexible(
                  child: CustomDynamicWidget(
                hintText: "Password",
                errorText: "Please enter your password",
                labelText: "Password",
                prefixIcons: Icons.password,
                fieldType: "Password",
                textInputType: TextInputType.visiblePassword,
                focusNode: _passwordFocusNode,
              )),
              const LoginButtonAndText(),
            ],
          ),
        ),
      ),
    );
  }

  void addUserDetails() {
    userDetails.add(UserDetails(
        "zahid", "zahid@gmail.com", "01256348", "1234234", "2376937"));
    userDetails.add(UserDetails(
        "mahid", "mahid@gmail.com", "01256348", "1234234", "2376937"));
    userDetails.add(UserDetails(
        "nahid", "nahid@gmail.com", "01256348", "1234234", "2376937"));
    userDetails.add(UserDetails(
        "uhid", "uhid@gmail.com", "01256348", "1234234", "2376937"));
    userDetails.add(UserDetails(
        "touhid", "touhid@gmail.com", "01256348", "1234234", "2376937"));
    userDetails.add(UserDetails(
        "shohid", "shohid@gmail.com", "01256348", "1234234", "2376937"));
  }
}
