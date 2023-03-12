import 'package:flutter/cupertino.dart';

class LoginDaftarTextView extends StatelessWidget {
  const LoginDaftarTextView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(Object context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
