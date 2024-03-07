import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacroWidget extends StatelessWidget {
  final String title;
  final int value;
  final IconData iconName;

  const MyMacroWidget(
      {required this.title,
      required this.iconName,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                offset: Offset(3, 3),
                blurRadius: 5,
                color: Colors.grey,
              )
            ]),
        child: Column(
          children: [
            FaIcon(
              iconName,
              color: Colors.red,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title == 'Calories' ? '$value $title' : '${value}g $title',
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
