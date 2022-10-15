import 'package:flutter/material.dart';
import '../common/constants.dart';
import '../generated/l10n.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? S.of(context).doNotAccount : S.of(context).alreadyAccount,
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? S.of(context).SignUp.toUpperCase() : S.of(context).login.toUpperCase(),
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
