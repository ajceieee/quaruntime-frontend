import 'package:flutter/cupertino.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/services/auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:stacked/stacked.dart';

class HomeScreenVM extends BaseViewModel {
  String get title => HOME_TITLE;
  FirebaseAuthService _authService = locator<FirebaseAuthService>();
  EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();

  final _formKey = GlobalKey<FormState>();

  HomeScreenVM() {
    _initialNameValue = _authService.currentUser!.displayName;
    _intialEmailValue = _authService.currentUser!.email;
  }

  String? _initialNameValue;
  String? _intialEmailValue;

  set nameValue(name) {
    _initialNameValue = name;
  }

  set emailValue(email) {
    _intialEmailValue = email;
  }

  String? get name => _initialNameValue;
  String? get email => _intialEmailValue;
  get formKey => _formKey;

  void onPressed() {
    if (!_formKey.currentState!.validate()) {
      _easyLoadingService.showToast("Code field can't be empty");
    } else {
      print("Submit");
    }
  }
}
