import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:seventh_player/cores/custom_divider.dart';
import 'package:seventh_player/cores/custom_load_button.dart';
import 'package:seventh_player/cores/custom_password_text.dart';
import 'package:seventh_player/cores/custom_text_field.dart';
import 'package:seventh_player/cores/validators.dart';
import 'package:seventh_player/features/login/presentation/controllers/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Form(
          key: controller.formKey,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Image.asset('assets/images/seventh_logo.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      suffixIcon: Container(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0))),
                          child: const Icon(
                            FontAwesomeIcons.idCard,
                            color: Colors.grey,
                            size: 20,
                          )),
                      label: 'user name',
                      hint: 'Type the username',
                      onChanged: (value) {},
                      controller: controller.usernamecontroller,
                      validator: Validators.validarUsername,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomPasswordTextField(
                      controller: controller.passwordcontroller,
                      validator: Validators.validarUsername,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller
                                      .loggin(
                                          controller.usernamecontroller.text,
                                          controller.passwordcontroller.text)
                                      .then((value) {
                                    if (controller.statusCode == 401) {
                                      const snackBar = SnackBar(
                                          content: Text(
                                              'username or password is wrong'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    if (controller.statusCode == 200) {
                                      const snackBar = SnackBar(
                                          content: Center(
                                        child: CircularProgressIndicator(),
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    if (controller.statusCode == 400) {
                                      const snackBar = SnackBar(
                                          content: Text('Error in internet'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  child: const Center(
                                    child: Text("Login"),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: HexColor("1a6069"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12), // <-- Radius
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('REGISTER'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('or'),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomDivider(),
                          CustomLoadButton(
                              onPressed: () {}, title: 'Continue with Google'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
