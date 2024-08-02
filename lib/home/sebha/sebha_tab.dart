import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = 'sebha';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotationAngle = 0.0;
  int counter = 0;

  void _rotateImage() {
    setState(() {
      rotationAngle += 0.18; // Rotate the image by 0.5 radians
    });
  }

  void increase() {
    setState(() {
      if (counter == 132) {
        counter = 1; // Reset the counter to 1 when it reaches 133
      } else {
        counter++;
      }
    });
  }

  String? getCounterMessage(int counter) {
    return counter <= 33
        ? AppLocalizations.of(context)!.subhan_allah
        : counter <= 66
            ? AppLocalizations.of(context)!.alhamd_lilah
            : counter <= 99
                ? AppLocalizations.of(context)!.there_is_no_god_but_god
                : counter <= 132
                    ? AppLocalizations.of(context)!.god_is_great
                    : null; // This handles counters greater than 132, though it should reset before this point
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _rotateImage();
              increase();
            },
            child: Transform.rotate(
              angle: rotationAngle,
              child: Image.asset('assets/images/sebhaa.png'),
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.number_of_tasbeh,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: 160.0, vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xffB7935F),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            '$counter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 60),
          decoration: BoxDecoration(
            color: Color(0xffB7935F),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            getCounterMessage(counter) ?? '',
            // Display the message or empty string if null
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
