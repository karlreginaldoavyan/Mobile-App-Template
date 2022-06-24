import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:general/general.dart';
import 'package:http/http.dart' as http;
import 'package:login/features/authentication/model/input/user_register.dart';

import '../../../core/constant/url.dart';
import '../model/input/user_login.dart';
import '../model/output/user_data.dart';
import '../model/output/user_data_error.dart';

class AuthenticationProvider extends ChangeNotifier {
  // State
  final _client = http.Client();
  bool _isLoggedIn = false;
  bool _loading = false;
  bool _password = true;
  String _errorMessage = '';
  late UserData _userData;

  //Getter
  bool get isLoggedIn => _isLoggedIn;
  bool get loading => _loading;
  bool get password => _password;
  String get errorMessage => _errorMessage;
  UserData get userData => _userData;

  // Actions
  void logOut() {
    _password = !_password;
    notifyListeners();
  }

  void showPassword() {
    _password = !_password;
    notifyListeners();
  }

  void login(BuildContext context, UserLogin body) async {
    print('Logging In');

    print(body.toJson());
    _loading = true;
    notifyListeners();
    try {
      var response =
          await _client.post(Uri.https(BASE_URL, 'login'), body: body.toJson());

      var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

      var isSuccess = decodedResponse['status'];
      print(isSuccess);

      if (isSuccess) {
        var userData = UserData.fromJson(decodedResponse['data']);
        _userData = userData;
        _isLoggedIn = isSuccess;

        //* Add sharedpreference for users persistence
        //* show snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(decodedResponse['message']),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        var userDataError = UserDataError.fromMap(decodedResponse);
        _isLoggedIn = isSuccess;
        _errorMessage = userDataError.message;

        ///! Show Error Dialog,Snackbar or anything.
        ///! Just inform user that they input incorrect credentials
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(_errorMessage),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
        _loading = false;
        return null;
      }
    } catch (e) {
      print('$e');
      _isLoggedIn = false;
      _errorMessage = '$e';

      ///! Show Error Dialog,Snackbar or anything.
      ///! Just inform user that they input incorrect credentials
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomText(_errorMessage),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      _loading = false;
      return null;
    } finally {
      notifyListeners();
    }

    _loading = false;
    notifyListeners();
  }

  void register(BuildContext context, UserRegister body) async {
    print('Logging In');

    _loading = true;
    notifyListeners();
    try {
      var response =
          await _client.post(Uri.https(BASE_URL, 'users'), body: body.toMap());

      var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

      var isSuccess = decodedResponse['status'];
      print(isSuccess);

      if (isSuccess) {
        var userData = UserData.fromJson(decodedResponse['data']);
        _userData = userData;
        _isLoggedIn = isSuccess;

        //* Add sharedpreference for users persistence
        //* show snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(decodedResponse['message']),
            backgroundColor: Colors.green,
          ),
        );

        //* Go back to login screen after succesful creating account
        Navigator.pop(context);
      } else {
        var userDataError = UserDataError.fromMap(decodedResponse);
        _isLoggedIn = isSuccess;
        _errorMessage = userDataError.message;

        ///! Show Error Dialog,Snackbar or anything.
        ///! Just inform user that they input incorrect credentials
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(_errorMessage),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
        _loading = false;
        return null;
      }
    } catch (e) {
      print('$e');
      _isLoggedIn = false;
      _errorMessage = '$e';

      ///! Show Error Dialog,Snackbar or anything.
      ///! Just inform user that they input incorrect credentials
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomText(_errorMessage),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      _loading = false;
      return null;
    } finally {
      notifyListeners();
    }

    _loading = false;
    notifyListeners();
  }
}
