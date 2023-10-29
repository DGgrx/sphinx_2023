import 'package:flutter/material.dart';


class TabButton extends StatelessWidget {
   const TabButton({
    Key? key,
    required this.callback,
    required this.title,
    required this.inFocus,
     this.textPad
  }) : super(key: key);

  final VoidCallback callback;
  final String title;
  final bool inFocus;
  final double? textPad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: inFocus ? Colors.white : Colors.black,

          border: Border.all(
            color: Colors.white,
            width: 2
          )
            ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 8,horizontal: textPad ??8),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Rog",
                // fontWeight: FontWeight.w600,
                fontSize: 12,
                // letterSpacing: 0.0,
                color: inFocus ? Colors.black: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

