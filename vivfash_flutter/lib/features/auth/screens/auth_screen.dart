import 'package:flutter/material.dart';
import 'package:vivfash_flutter/common/widget/custom_button.dart';
import 'package:vivfash_flutter/common/widget/custom_textfield.dart';
import 'package:vivfash_flutter/constants/global_variables.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routename = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
              tileColor: _auth == Auth.signup?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create an Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      CustomTextField(controller: _nameController, hintText: 'Nane'),
                      SizedBox(height: 10,),
                      CustomTextField(controller: _emailController, hintText: "email"),
                      SizedBox(height: 10,),
                      CustomTextField(controller: _passwordController, hintText: "password"),
                      SizedBox(height: 10,),
                      CustomButton(text: 'Sign-UP', onTap: (){})

                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
              title: const Text(
                "signin",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: EdgeInsets.all(8.0),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                    
                      CustomTextField(controller: _emailController, hintText: "email"),
                      SizedBox(height: 10,),
                      CustomTextField(controller: _passwordController, hintText: "password"),
                      SizedBox(height: 10,),
                      CustomButton(text: 'Sign-in', onTap: (){})

                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
