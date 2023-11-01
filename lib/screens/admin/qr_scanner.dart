import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:sphinx_2023/common/sphinx_loader.dart';
import 'package:sphinx_2023/screens/admin/view_model/qr_scan_vm.dart';
import 'package:sphinx_2023/theme/color_def.dart';

class QRScanScreen extends StatelessWidget {
  QRScanScreen({super.key});

  final MobileScannerController _controller = MobileScannerController(
  // formats: [BarcodeFormat.],
  detectionSpeed: DetectionSpeed.normal,
  facing: CameraFacing.back,
  // torchEnabled: true,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<QRScanVM>(
      builder: (context,qrVm,_) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 20, 10),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            // leadingWidth: 60,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.11,
            backgroundColor: Colors.black,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
              child: Image.asset(
                "assets/sphinx_banner.png",
                width: MediaQuery.of(context).size.width * 0.65,
              ),
            ),
          ),
          body: MobileScanner(

            placeholderBuilder: (context, _) {
              return Center(
                child: Container(
                  height: 600,
                  child: LoadingScreen(),
                ),
              );
            },
            // fit: BoxFit.contain,
            controller: _controller,
            onDetect: (capture) {
              // Barcode barcode = capture.raw;
              Barcode barcode = capture.barcodes.last;
              // final Uint8List? image = capture.image;
              // for (final barcode in barcodes) {
              //   print('Barcode found! ${barcode.displayValue}');
              // }
              qrVm.getUniqID(barcode.displayValue.toString());
              _controller.dispose();
              qrVm.torch = false;
              Navigator.pop(context);
              qrVm.scanQr();
            },
            overlay: QRScannerOverlay(
              scanAreaSize: Size.square(250),
              overlayColor: Colors.transparent,

            ),
          ),
          floatingActionButton: FloatingActionButton(
            splashColor: buttonYellow,
            elevation: 0,
            backgroundColor: Colors.black,
            onPressed: (){
              qrVm.toggleTorch();
              _controller.toggleTorch();
              },
            child: qrVm.torch? Icon(Icons.flash_on,
            color: Colors.white,):Icon(Icons.flash_off,
              color: Colors.white,),
            // color: buttonYellow,
          )
        );
      }
    );
  }
}
