import 'package:capitalplace/src/core/widgets/icon_button_widget.dart';
import 'package:capitalplace/src/core/widgets/input_widget.dart';
import 'package:capitalplace/src/features/auth/presenter/pages/login_code_page.dart';
import 'package:flutter/material.dart';

// constants
import 'package:capitalplace/src/core/constants/app_constants.dart';

// widgets
import 'package:capitalplace/src/core/widgets/button_widget.dart';

import 'package:capitalplace/src/features/auth/presenter/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;

  static const String route = '/login';

  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: AppColorConstants.primary,
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.close,
              color: AppColorConstants.white,
              size: 24.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          backgroundColor: AppColorConstants.primary,
          elevation: 0.0,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bem vindo!",
                  style: AppTypographyConstants.heading.copyWith(
                    color: AppColorConstants.white,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Faça login em sua conta",
                  style: AppTypographyConstants.body.copyWith(
                    color: AppColorConstants.white,
                  ),
                ),
                const SizedBox(
                  height: 42.0,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      InputWidget(
                        label: "E-mail",
                        hint: "seuemail@email.com",
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite o e-mail";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      InputWidget(
                        label: "Senha",
                        hint: "************",
                        textInputAction: TextInputAction.send,
                        obscureText: isPasswordVisible,
                        suffixIcon: IconButtonWidget(
                          iconData: isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 22.0,
                          color: AppColorConstants.white,
                          onTap: _togglePasswordVisibility,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite a senha";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                SizedBox(
                  width: width,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Esqueceu a senha?",
                      style: AppTypographyConstants.link.copyWith(
                        color: AppColorConstants.secondary,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                ButtonWidget(
                  title: "Entrar",
                  typography: AppTypographyConstants.button.copyWith(
                    color: AppColorConstants.primary,
                  ),
                  background: AppColorConstants.secondary,
                  onPressed: () async => {
                    if (formKey.currentState!.validate())
                      {
                        widget.controller
                            .doLogin(
                                email: 'email@email.com', password: '123456')
                            .catchError((err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(err.message)),
                          );
                        }).then(
                          (value) {
                            Navigator.pushNamed(context, LoginCodePage.route);

                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //       content: Text('Logado com sucesso')),
                            // );
                          },
                        ),
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Preencha as informações de login',
                            ),
                          ),
                        ),
                      }
                  },
                ),
                const SizedBox(
                  height: 22.0,
                ),
                SizedBox(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Não tem uma conta?",
                        style: AppTypographyConstants.body.copyWith(
                          color: AppColorConstants.white,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Inscrever-se",
                          style: AppTypographyConstants.body.copyWith(
                            color: AppColorConstants.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
