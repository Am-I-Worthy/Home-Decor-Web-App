import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// double hoverUnderlineHeight = 1.5;
// double hoverUnderLineWidth = 0.0;
// double hoverUnderlineHeight2 = 1.5;
// double hoverUnderLineWidth2 = 0.0;

class TopBar extends StatefulWidget {
  final double height;
  final double width;

  TopBar(this.height, this.width);
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        //color: Colors.blue,
        height: 40.0,
        width: widget.width * 0.22,
        margin: EdgeInsets.only(
          top: 30.0,
          left: 50.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Axis.',
                style: GoogleFonts.josefinSans(
                    fontSize: 24.0, fontWeight: FontWeight.w700),
              ),
            ),
            TopBarItem(text: 'About',),
            TopBarItem(text: 'Explore',),
          ],
        ),
      ),
    );
  }
}

class TopBarItem extends StatefulWidget {
  final String text;

  TopBarItem({this.text});

  @override
  _TopBarItemState createState() => _TopBarItemState();
}

class _TopBarItemState extends State<TopBarItem> {
  double hoverUnderLineWidth2 = 0.0;
  double hoverUnderlineHeight2 = 1.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            onEnter: (value) {
              setState(() {
                hoverUnderLineWidth2 = 20.0;
                hoverUnderlineHeight2 = 1.5;
              });
            },
            onExit: (value) {
              setState(() {
                hoverUnderLineWidth2 = 0.0;
                hoverUnderlineHeight2 = 1.5;
              });
            },
            child: Text(
              widget.text,
              style: GoogleFonts.raleway(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          AnimatedContainer(
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
            height: hoverUnderlineHeight2,
            width: hoverUnderLineWidth2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
