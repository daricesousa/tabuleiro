import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tabuleiro/core/exceptions/auth_exception.dart';
import 'package:tabuleiro/core/exceptions/rest_client_exception.dart';
import 'package:tabuleiro/core/ui/widgets/app_snack_bar.dart';
import 'package:tabuleiro/services/auth/auth_service.dart';

class SignController extends GetxController {
  final AuthService _service;
  final loading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignController(this._service);

  void sign() async {
    if (formKey.currentState!.validate() == false) return;
    loading.value = true;
    try {
      await _service.sign(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAndToNamed('/games');
    } on UnauthorizeException {
      AppSnackBar.error("E-mail ou senha inválidos");
    } on RestClientException {
      AppSnackBar.error("Falha ao se comunicar com o servidor");
    } catch (e) {
      AppSnackBar.error("Falha ao realizar login");
    } finally {
      loading.value = false;
    }
  }
}
