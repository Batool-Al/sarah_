import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_purple/Screens/Login/login_screen.dart';
import 'package:flutter_login_purple/Screens/Signup/components/background.dart';
import 'package:flutter_login_purple/Screens/Signup/components/or_divider.dart';
import 'package:flutter_login_purple/components/already_have_an_account_acheck.dart';
import 'package:flutter_login_purple/components/rounded_button.dart';
import 'package:flutter_login_purple/components/rounded_input_field.dart';
import 'package:flutter_login_purple/components/rounded_small_input_field.dart';
import 'package:flutter_login_purple/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            Row(
              children: [
                SizedBox(width: 33,),
                SmallTextInputField(
                  icon: Icons.account_circle_outlined,
                  hint: 'First Name',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                ),
                SmallTextInputField(
                  icon: Icons.account_circle_outlined,
                  hint: 'Last Name',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                ),
              ],
            ),
            TextInputField(
              icon: Icons.account_box_outlined,
              hint: "User ID",
              inputType: TextInputType.numberWithOptions(decimal: false, signed: false),
              inputAction: TextInputAction.next,
            ),
            TextInputField(
              icon: Icons.email_outlined,
              hint: 'Email',
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
            ),

            SizedBox(height: size.height * 0.01),
            Drop(),
            SizedBox(height: size.height * 0.01),
            PasswordInput(
              icon: Icons.lock_outline,
              hint: "Password"
              ,inputAction: TextInputAction.next,
            ),
            PasswordInput(
              icon: Icons.lock_outline,
              hint: "Confirm Password"
              ,inputAction: TextInputAction.done,
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
              //   try{
              //     User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
              //         email: _emailController.text, password: _passwordController.text,)).user;
              //   if(user != null){
              //   UserUpdateInfo updateUser = UserUpdateInfo();
              //   updateUser.displayName = _usernameController.text;
              //   user.updateProfile(updateUser);
              //   Navigator.pushNamed(context, "/Welcome");
              //   }
              //   } catch (e) {
              //   print(e);
              //   _usernameController.text = "";
              //   _passwordController.text = "";
              //   _repasswordController.text = "";
              //   _emailController.text = "";
              //   // TODO: alertdialog with error
              //   }
               },
            ),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
          ],
        ),
      ),
    );
  }
}
class Drop extends StatefulWidget {
  @override
  _DropState createState() => _DropState();
}

class _DropState extends State<Drop> {
  String currentItemSelected ;
  String nameCity = "";
  List listItem = ["ITC", "Business", "English Literature"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[500].withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            height: size.height * 0.08,
            width: size.width * 0.8,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: DropdownButton(
              hint: Center(
                child:
                Text("Select Major:",
                  style: TextStyle(fontSize: 15, color: Colors.white, height: 1.5,fontFamily: "NotoSerif-Bold" ),
                ),
              ),
              isExpanded: true ,
              icon: Center(
                  child:
                  Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white, )),

              style: TextStyle(color: Colors.blueGrey, fontFamily: "NotoSerif-Bold" ),

              dropdownColor: Colors.red[50],
              items: listItem.map((dropDownStringItem) {
                return DropdownMenuItem  (
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              focusColor: Colors.grey.withOpacity(0.5),
              onChanged: ( var newValueSelected){
                setState(() {
                  this.currentItemSelected = newValueSelected;
                });
              },
              value: currentItemSelected,
            ),
          ),
        )


    );
  }
}