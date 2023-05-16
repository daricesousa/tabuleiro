import 'package:get/get.dart';
import 'package:tabuleiro/core/rest_client/rest_client.dart';
import 'package:tabuleiro/core/rest_client/uno_client.dart';
import 'package:tabuleiro/core/storage/app_storage.dart';
import 'package:tabuleiro/core/storage/get_storage.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppStorage>(() => GetStorage(), fenix: true);
    Get.lazyPut<RestClient>(
      () => UnoClient(Get.find<AppStorage>()),
      fenix: true,
    );
  }
}
