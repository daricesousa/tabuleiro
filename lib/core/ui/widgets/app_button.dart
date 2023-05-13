import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final bool loading;
  const AppButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (!loading) {
            onPressed?.call();
          }
        },
        child: Visibility(
          visible: loading,
          replacement: Text(label),
          child: const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
