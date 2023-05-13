import 'package:get/get.dart';
import './sign_controller.dart';

class SignBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(SignController());
    }
}