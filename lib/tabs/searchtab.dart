import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_for_noobs/widgets/destination_carousel.dart';
import 'package:travel_for_noobs/widgets/stories_carousel.dart';

class searchtab extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<searchtab> {
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Color(0xFFD8ECF1)
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Color(0xFF3EBACE)
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: 'Hello, ', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.lightBlueAccent)),
                  TextSpan(text: 'What are you looking for?')
                ], style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 32)
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
              )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            DestinationCarousel(),
            stories_carousel(),
          ],
        ),
      ),
    );
  }
}
