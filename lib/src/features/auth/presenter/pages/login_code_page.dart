import 'package:capitalplace/src/core/widgets/button_widget.dart';
import 'package:capitalplace/src/core/widgets/input_widget.dart';
import 'package:flutter/material.dart';

// constants
import 'package:capitalplace/src/core/constants/app_constants.dart';

// controllers
import 'package:capitalplace/src/features/auth/presenter/controllers/login_code_controller.dart';

class LoginCodePage extends StatefulWidget {
  final LoginCodeController controller;

  static const String route = '/login_code';

  const LoginCodePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _LoginCodePageState createState() => _LoginCodePageState();
}

class _LoginCodePageState extends State<LoginCodePage> {
  final formKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: AppColorConstants.primary,
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Digite o código",
                  style: AppTypographyConstants.heading.copyWith(
                    color: AppColorConstants.white,
                  ),
                ),
                const SizedBox(
                  height: 22.0,
                ),
                Text(
                  "Insira o código que enviamos para:",
                  style: AppTypographyConstants.body.copyWith(
                    color: AppColorConstants.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "+55 9 8445-5442",
                      style: AppTypographyConstants.body.copyWith(
                        color: AppColorConstants.white,
                      ),
                    ),
                    Text(
                      "Editar Número",
                      style: AppTypographyConstants.body.copyWith(
                        color: AppColorConstants.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 42.0,
                ),
                Form(
                  key: formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PinNumber(
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focus);
                        },
                      ),
                      PinNumber(
                        focusNode: focus,
                        textInputAction: TextInputAction.next,
                      ),
                      PinNumber(
                        textInputAction: TextInputAction.next,
                      ),
                      PinNumber(
                        textInputAction: TextInputAction.next,
                      ),
                      PinNumber(
                        textInputAction: TextInputAction.next,
                      ),
                      PinNumber(
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 78.0,
                ),
                ButtonWidget(
                  title: "Reenviar código",
                  onPressed: () {},
                  side: const BorderSide(
                    width: 1.0,
                    color: AppColorConstants.secondary,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ButtonWidget(
                  title: "Próximo",
                  typography: AppTypographyConstants.button.copyWith(
                    color: AppColorConstants.primary,
                  ),
                  background: AppColorConstants.secondary,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PinNumber extends StatelessWidget {
  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final void Function(String focus)? onFieldSubmitted;
  final FocusNode? focusNode;

  const PinNumber({
    Key? key,
    this.textEditingController,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      child: InputWidget(
        textEditingController: textEditingController,
        maxLength: 1,
        textInputAction: textInputAction,
        keyboardType: TextInputType.number,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
      ),
    );
  }
}
