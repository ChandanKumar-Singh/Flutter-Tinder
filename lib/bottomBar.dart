import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleButton(Icons.refresh, Colors.amber),
            CircleButton(Icons.close, Colors.red),
            CircleButton(Icons.star, Colors.blue),
            CircleButton(Icons.favorite_outline_outlined, Colors.pink),
            CircleButton(Icons.bolt, Colors.purple),
          ],
        ),
      ),
    );
  }
}

Widget CircleButton(IconData icon, Color color) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(color: color),
    ),
    child: Icon(
      icon,
      size: 30,
      color: color,
    ),
  );
}
