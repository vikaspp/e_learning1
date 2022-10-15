import 'package:flutter/material.dart';

import '../../../common/constants.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../generated/l10n.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration:  InputDecoration(
             // hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Text(S.of(context).enterEmail),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration:  InputDecoration(
               // hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Text(S.of(context).enterPassword),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {},
            child: Text(S.of(context).SignUp.toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}