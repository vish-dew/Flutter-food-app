// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';

// class QrScan extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return QrScanState();
//   }
// }

// class QrScanState extends State<QrScan> {
//   dynamic _barcode = "null";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('QR Scanner'),
//         ),
//         body: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Image.asset(
//                 'assets/done1.gif',
//                 height: 150,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10.0),
//                 child: RaisedButton(
//                   color: Colors.blueAccent,
//                   textColor: Colors.black,
//                   splashColor: Colors.blueGrey,
//                   onPressed: scan,
//                   child: const Text(
//                     'Scan QR.',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Text(
//                   _barcode,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }

//   Future scan() async {
//     try {
//       String barcode = await BarcodeScanner.scan();
//       setState(() => this._barcode = barcode);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.CameraAccessDenied) {
//         setState(() {
//           this._barcode = 'El usuario no dio permiso para el uso de la cámara!';
//         });
//       } else {
//         setState(() => this._barcode = 'Error desconocido $e');
//       }
//     } on FormatException {
//       setState(() => this._barcode =
//           'nulo, el usuario presionó el botón de volver antes de escanear algo)');
//     } catch (e) {
//       setState(() => this._barcode = 'Error desconocido : $e');
//     }
//   }
// }
