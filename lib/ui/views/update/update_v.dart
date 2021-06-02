import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/widgets/button_widget.dart';
import 'package:flutter_boiler_plate/ui/widgets/card.dart';
import 'package:flutter_boiler_plate/ui/widgets/text_field_widget.dart';
import 'package:stacked/stacked.dart';

import 'update_vm.dart';

class UpdateScreenV extends StatelessWidget {
  const UpdateScreenV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenVM>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text("Quaruntime"),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: AppCard1(
              child: Form(
                key: model.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Your Details",
                    ),
                    TextFieldWidget(
                      enabled: false,
                      initialValue: model.name ?? "",
                      onChanged: (value) {
                        model.nameValue = value;
                      },
                      labelText: "Name",
                      validator: (value) {},
                      hintText: "name",
                    ),
                    TextFieldWidget(
                      enabled: false,
                      initialValue: model.email ?? "",
                      onChanged: (value) {
                        model.emailValue = value;
                      },
                      labelText: "Email",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please provide your email";
                        }
                      },
                      hintText: "Email",
                    ),
                    TextFieldWidget(
                      onChanged: (value) {},
                      labelText: "Code",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field can't be empty";
                        } else if (value.length < 6) {
                          return "The code should be of length 6";
                        } else
                          return null;
                      },
                      hintText: "Code",
                    ),
                    ButtonWidget(
                       color: Colors.yellow,
                      onPressed: model.onPressed,
                      text: "Submit",
                    )
                  ],
                ),
              ),
              key: Key("home_card"),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeScreenVM(),
    );
  }
}
