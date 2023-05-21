import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabuleiro/core/ui/widgets/app_button.dart';

class DialogLogout extends StatelessWidget {
  final void Function()? onConfirm;
  const DialogLogout({Key? key, this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 200),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Logout',
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              const Text('Desejar deslogar?'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppButton(
                    onPressed: Get.back,
                    label: 'Não',
                  ),
                  AppButton(
                    onPressed: onConfirm,
                    label: 'Sim',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
