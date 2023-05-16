import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tabuleiro/modules/game/game_detail/game_detail_bindings.dart';
import 'package:tabuleiro/modules/game/game_detail/game_detail_page.dart';
import 'package:tabuleiro/modules/game/game_list/game_list_bindings.dart';
import 'package:tabuleiro/modules/game/game_list/game_list_page.dart';
import 'package:tabuleiro/modules/sign/sign_bindings.dart';
import 'package:tabuleiro/modules/sign/sign_page.dart';

class Routes {
  List<GetPage> get pages => [
        GetPage(
            name: '/sign',
            page: () => const SignPage(),
            binding: SignBindings()),
        GetPage(
            name: '/games',
            page: () => const GameListPage(),
            binding: GameListBindings(),
            children: [
              GetPage(
                name: '/detail/:id',
                page: () => const GameDetailPage(),
                binding: GameDetailBindings(),
              ),
            ]),
      ];
}
