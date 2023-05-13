import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './game_detail_controller.dart';

class GameDetailPage extends GetView<GameDetailController> {
    
    const GameDetailPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('GameDetailPage'),),
            body: Container(),
        );
    }
}