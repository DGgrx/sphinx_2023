
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sphinx_2023/common/sphinx_loader.dart';
import 'package:sphinx_2023/screens/admin/qr_scanner.dart';
import 'package:sphinx_2023/screens/admin/view_model/qr_scan_vm.dart';
import 'package:sphinx_2023/screens/login/view_model/login_vm.dart';
import 'package:sphinx_2023/theme/color_def.dart';

import '../../models/event.dart';


class QRScannerPage extends StatelessWidget {
  const QRScannerPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Consumer2<QRScanVM,LoginVm>(builder: (context, qrVm,loginVm, _) {
      List<String> list = qrVm.menuItems;
      List<Event> allEvents = loginVm.events;
      // qrVm.dropDownval = ;
      qrVm.setMenuValue(list.first);
      print(qrVm.searchEvent);

      return qrVm.isLoading
          ? LoadingScreen()
          : Scaffold(
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
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.st,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 8),
                      child: Text(
                        "Please Choose the event you want to Scan the QR For,",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Poppins"),
                      ),
                    ),
                    Center(
                      child: DropdownMenu<String>(
                        width: MediaQuery.of(context).size.width * 0.74,
                        textStyle: TextStyle(
                            fontFamily: "Poppins", fontWeight: FontWeight.bold),
                        inputDecorationTheme: InputDecorationTheme(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          filled: true,
                          fillColor: buttonYellow,
                          iconColor: Colors.white,
                        ),
                        initialSelection: "-",
                        onSelected: (String? value) {
                          qrVm.setMenuValue(value);
                          qrVm.getSearchEvent(allEvents);
                        },
                        dropdownMenuEntries:
                            list.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55.0, vertical: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(color: Colors.white)),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            print("QR Scanning Started");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => QRScanScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30.0, horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  "TAP TO SCAN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Black",
                                      fontSize: 20),
                                ),
                                Icon(
                                  Icons.qr_code_2,
                                  color: Colors.white,
                                  size: 200,
                                ),
                                Text(
                                  "QR CODE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-Black",
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Last Scanned User : ${qrVm.scannedQr}\nName : ${qrVm.user.name}\nEmailID : ${qrVm.user.email}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      "assets/love.png",
                      height: 35,
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            );
    });
  }
}
