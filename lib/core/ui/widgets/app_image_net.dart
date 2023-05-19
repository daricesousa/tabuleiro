import 'package:flutter/material.dart';

class AppImageNet extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;

  const AppImageNet({
    Key? key,
    this.imageUrl,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl ?? '',
        fit: BoxFit.cover,
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
            height: height,
            width: width,
            child: const Icon(Icons.error),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return SizedBox(
            height: height,
            width: width,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
