import 'package:flutter/material.dart';

import '../theme/color_def.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.callback,
    required this.title,
  }) : super(key: key);

  final VoidCallback callback;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: buttonYellow,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: buttonYellow.withOpacity(0.6),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 3),
              )
            ]),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 0.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
