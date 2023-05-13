import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './game_list_controller.dart';

class GameListPage extends GetView<GameListController> {
    
    const GameListPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('GameListPage'),),
            body: Container(),
        );
    }
}