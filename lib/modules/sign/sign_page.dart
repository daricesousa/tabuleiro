import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tabuleiro/core/ui/widgets/app_button.dart';
import 'package:tabuleiro/core/ui/widgets/app_form_field.dart';
import './sign_controller.dart';
import 'package:mask/mask.dart';

class SignPage extends GetView<SignController> {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2))
                  ]),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login", style: context.textTheme.headlineSmall),
                    const SizedBox(height: 16),
                    AppFormField(
                      label: "E-mail",
                      placeholder: "Informe seu e-mail...",
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: Mask.validations.email,
                    ),
                    const SizedBox(height: 16),
                    AppFormField(
                      label: "Senha",
                      placeholder: "Informe sua senha...",
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      controller: controller.passwordController,
                      validator: (value) =>
                          Mask.validations.generic(value, error: "Campo vazio"),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      label: "Entrar",
                      onPressed: controller.sign,
                    ),
                  ],
                ),
              ))),
    );
  }
}
