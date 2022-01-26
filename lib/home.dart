import 'package:flutter/material.dart';
import 'package:flutter_tinder/alertFunctions.dart';
import 'package:flutter_tinder/appBar.dart';
import 'package:flutter_tinder/bottomBar.dart';
import 'package:swipe_cards/swipe_cards.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  List<String> names = [
    'Cks',
    'Prakhar',
    'Aditya',
    'Abhishek',
    'Pradeep',
    'Chandan'
  ];
  List<String> images = ['1', '2', '3', '4', '5', '0'];
  @override
  void initState() {
    for (int i = 0; i < names.length; i++) {
      swipeItems.add(
        SwipeItem(
          content: Content(text: names[i]),
          likeAction: () =>actions(context, names[i], 'Liked'),
          nopeAction: () =>actions(context, names[i], 'Rejected'),
          superlikeAction:  () =>actions(context, names[i], 'SuperLiked'),
        ),
      );
    }
    matchEngine = MatchEngine(swipeItems: swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const TopBar(),
            Expanded(
              child: SwipeCards(
                itemBuilder: (context, i) => Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('assets/$i.jpg'),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        names[i],
                        style:
                            const TextStyle(fontSize: 32, color: Colors.white),
                      )
                    ],
                  ),
                ),
                matchEngine: matchEngine!,
                upSwipeAllowed: true,
                onStackFinished: () {
                  return ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('The List is over')));
                },
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}

class Content {
  final String text;
  Content({required this.text});
}
