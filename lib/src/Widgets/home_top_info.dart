import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget {
  final textstyle = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'What would',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'you like to eat?',
              style: textstyle,
            ),
          ],
        ),
      ],
    );
  }
}
// AnimatedTextKit(
//   animatedTexts: [
//     RotateAnimatedText('What would'),
//     RotateAnimatedText('you like to eat'),
    
//   ],
// )
