import 'package:flutter/material.dart';
import 'package:vivfash_flutter/constants/error_handling.dart';
import 'package:vivfash_flutter/constants/global_variables.dart';
import 'package:vivfash_flutter/constants/utils.dart';
import 'package:vivfash_flutter/models/user.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String lastName,
      required String firstName,
      required String password}) async {
    try {
      User user = User(
          id: '',
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          role: '',
          contactNumber: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'accounts has been created successsfully');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
