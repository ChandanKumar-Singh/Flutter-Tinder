import 'package:flutter/material.dart';
import 'package:flutter_tinder/bottomBar.dart';

actions(BuildContext context, String name, type) {
  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(
            const Duration(seconds: 1), () => Navigator.of(context).pop(true));
        return AlertDialog(
          content: CircleButton(
            type == 'Liked'
                ? Icons.favorite
                : type == 'Rejected'
                    ? Icons.close
                    : Icons.star,
            type == 'Liked'
                ? Colors.red
                : type == 'Rejected'
                    ? Colors.red
                    : Colors.yellow[800]!,
          ),
          title: Text(
            'You $type $name',
            style: TextStyle(
              color: type == 'Liked'
                  ? Colors.green
                  : type == 'Rejected'
                      ? Colors.red
                      : Colors.blue,
            ),
          ),
        );
      });
}
