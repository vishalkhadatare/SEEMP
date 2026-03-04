import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({Key? key, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/app_logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (ctx, err, stack) => const Icon(Icons.business),
    );
  }
}
