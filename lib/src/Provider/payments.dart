import 'package:flutter/material.dart';
import 'package:food_app/src/Provider/success.dart';
import 'package:food_app/src/Widgets/HeaderLabel.dart';

import 'package:food_app/src/Widgets/button.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/screen/main_screen.dart';

class Payments extends StatefulWidget {
  Payments({Key key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  int value = 0;
  final paymentLabels = ['Credit Card / Debit Card', 'Pay by QR'];
  final paymentIcons = [Icons.credit_card, Icons.qr_code];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Payment',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => Success(),
                //   ),
                // );
              }),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderLabel(
              headerText: 'Choose your payment method',
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: paymentLabels.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Radio(
                          activeColor: Colors.blue,
                          groupValue: value,
                          value: index,
                          onChanged: (i) => setState(() => value = i)),
                      title: Text(
                        paymentLabels[index],
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        paymentIcons[index],
                        color: Colors.blue,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 1,
                    );
                  }),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 25.0, left: 20.0, right: 20.0),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Success(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Center(
                    child: Text(
                      "Pay now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:stripe_payment/stripe_payment.dart';

// class PaymentService {
//   PaymentService() {
//     StripePayment.setOptions(StripeOptions(
//         publishableKey:
//             "pk_test_51Jcat0AxotwGiJLjCVEUVOCoQRv89X3QlZrnGWte9uNbIAdzIuCjYtOz9MvbKTldTJ2tjwSSiV0Y3JVq7p1D2G3500I65qhvPU"));
//   }
// }


