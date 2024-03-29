import 'package:flutter/material.dart';

class InputTextButton extends StatelessWidget {
  final String title;
  final Function onClick;
  const InputTextButton({Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Color.fromRGBO(54, 105, 201, 1),
        minimumSize: const Size(double.maxFinite, 50),
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onClick();
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
