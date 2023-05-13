import 'package:flutter/material.dart';

class AppFormField extends StatefulWidget {
  final String label;
  final String? placeholder;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AppFormField({
    Key? key,
    required this.label,
    this.placeholder,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late bool visiblePassword;

  @override
  void initState() {
    visiblePassword = !widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: !visiblePassword,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        visiblePassword = !visiblePassword;
                      });
                    },
                    icon: Visibility(
                      visible: visiblePassword,
                      replacement: const Icon(Icons.visibility_off),
                      child: const Icon(Icons.visibility),
                    ),
                  )
                : null,
            hintText: widget.placeholder,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
