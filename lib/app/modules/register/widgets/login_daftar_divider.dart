import 'package:flutter/material.dart';

class LoginDaftarDivider extends StatelessWidget {
  const LoginDaftarDivider({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: SizedBox(
          height: 1,
          child: ColoredBox(color: Colors.grey),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Atau $title dengan',
          ),
        ),
        Expanded(
            child: SizedBox(
          height: 1,
          child: ColoredBox(color: Colors.grey),
        )),
      ],
    );
  }
}
