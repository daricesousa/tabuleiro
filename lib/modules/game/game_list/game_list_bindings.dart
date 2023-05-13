import 'package:get/get.dart';
import './game_list_controller.dart';

class GameListBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(GameListController());
    }
}