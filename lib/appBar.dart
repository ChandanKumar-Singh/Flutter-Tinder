import 'package:flutter/material.dart';
import 'package:flutter_tinder/bottomBar.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleButton(Icons.star, Colors.amber),
          imageWidget('assets/tinder.jpg'),
          imageWidget('assets/diamond.png'),
          CircleButton(Icons.notifications, Colors.grey.shade400),
        ],
      ),
    );
  }
}

Widget imageWidget(String image) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
  );
}
