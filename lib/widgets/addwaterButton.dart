import 'package:flutter/material.dart';
class addwaterButton extends StatelessWidget {
  final int amount;
  IconData ? icon;
  final VoidCallback Onclick;

  addwaterButton({
    super.key,
    required this.amount,
    this.icon,
    required this.Onclick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
            onPressed: Onclick,
            label: Text(
              "+ ${amount}ml",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            icon: Icon(
              icon ?? Icons.water_drop,
              color: Colors.white,
            )),
      ),
    );
  }
}