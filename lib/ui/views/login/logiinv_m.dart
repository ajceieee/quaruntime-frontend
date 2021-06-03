import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/login/Login_vm.dart';
import 'package:flutter_boiler_plate/ui/widgets/card.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:stacked/stacked.dart';

class LoginViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginVM>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: AppCard1(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    !model.signInBtnState
                        ? SignInButton(
                            Buttons.Google,
                            onPressed: model.onPressed,
                          )
                        : CircularProgressIndicator(),
                  ],
                ),
                key: Key("login_card"),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginVM(),
    );
  }
}
