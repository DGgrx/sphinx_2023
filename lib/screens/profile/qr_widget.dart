import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRWidgetCard extends StatelessWidget {
  const QRWidgetCard({required this.data, super.key});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/qr_back.png",
          height: MediaQuery.of(context).size.height * 0.42,
        ),
        Positioned(
          top: 20,
          child: QrImageView(
            // backgroundColor: ,
            size: MediaQuery.of(context).size.height * 0.28,
            //Madarchod Priyansh BKL User Persona galat banaya MC
            // data: "4417WVX",
            data: data,
          ),
        ),
        Positioned(
          bottom: 55,
          child: Text(
            //Madarchod Priyansh BKL User Persona galat banaya MC
            "#${data}",
            //   "4417WVX",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins-Black",
                fontSize: 30),
          ),
        ),
      ],
    );
  }
}
