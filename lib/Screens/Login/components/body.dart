import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Login/components/background.dart';
import 'package:flutter_login_purple/Screens/Signup/signup_screen.dart';
import 'package:flutter_login_purple/components/already_have_an_account_acheck.dart';
import 'package:flutter_login_purple/components/rounded_button.dart';
import 'package:flutter_login_purple/components/rounded_input_field.dart';
import 'package:flutter_login_purple/components/rounded_password_field.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                SizedBox(height:40),
                Container(height: 290,
                  width: 290,
                  child:
                  Lottie.asset('assets/images/1.json'),
                ),

                TextInputField(
                  controller: _emailController,
                  icon: Icons.email_outlined,
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                ),
                Container(
                  child: PasswordInput(
                    controller: _passwordController,
                    icon: Icons.lock,
                    hint: "Password",
                    inputAction: TextInputAction.done,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: RoundedButton(
                    text: "LOGIN",
                    press: () async {
                        try {
                        User user =
                            (await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _emailController.text, password: _passwordController.text,)).user;
                        if (user != null) {
                           Navigator.pushNamed(context, "/Welcome");
                        }
                        } catch (e) {
                        print(e);
                        _emailController.text = "";
                        _passwordController.text = "";
                        // TODO: AlertDialog with error
                        }
                    },
                  ),
              ),

              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),

          ],
        ),
      ),
    );
  }
}


