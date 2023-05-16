import 'package:get/get.dart';
import 'package:tabuleiro/repositories/auth/auth_repository.dart';
import 'package:tabuleiro/repositories/auth/auth_repository_impl.dart';
import 'package:tabuleiro/services/auth/auth_service.dart';
import 'package:tabuleiro/services/auth/auth_service_impl.dart';
import './sign_controller.dart';

class SignBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(AuthRepositoryImpl(Get.find()));
    Get.put<AuthService>(AuthServiceImpl(Get.find(), Get.find()));
    Get.put(SignController(Get.find()));
  }
}
