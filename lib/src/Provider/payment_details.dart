import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails({Key key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String cardNumber = "5450 7879 4864 7854",
      cardExpiry = "10/25",
      cardHolderName = "John Travolta",
      bankName = "ICICI Bank",
      cvv = "456";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:stripe_payment/stripe_payment.dart';

// class PaymentProvider with ChangeNotifier {
//   GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();
//   PaymentMethod _paymentMethod = PaymentMethod();
//   PaymentProvider.initialize() {
//     StripePayment.setOptions(StripeOptions(
//         publishableKey:
//             "pk_test_51Jcat0AxotwGiJLjCVEUVOCoQRv89X3QlZrnGWte9uNbIAdzIuCjYtOz9MvbKTldTJ2tjwSSiV0Y3JVq7p1D2G3500I65qhvPU"));
//   }

//   void addCard() {
//     StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
//         .then((PaymentMethod) {
//       _paymentMethod = PaymentMethod;
//     }).catchError((error) {
//       print('There was an error: ${error.toString()}');
//     });
//   }
// }
