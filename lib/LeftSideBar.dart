import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeftSideBar extends StatefulWidget {
  final double height;
  final int index;

  LeftSideBar(this.height, this.index);

  @override
  _LeftSideBarState createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 40.0),
        height: widget.height,
        width: 80.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PageIndicator(
              text: '01',
              index: 0,
              currIndex: widget.index,
            ),
            SizedBox(
              height: 15.0,
            ),
            PageIndicator(
              text: '02',
              index: 1,
              currIndex: widget.index,
            ),
            SizedBox(
              height: 15.0,
            ),
            PageIndicator(
              text: '03',
              index: 2,
              currIndex: widget.index,
            ),
            SizedBox(
              height: 15.0,
            ),
            PageIndicator(
              text: '04',
              index: 3,
              currIndex: widget.index,
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              color: Colors.black,
              height: 50.0,
              width: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  PageIndicator({this.text, this.index, this.currIndex});

  final String text;
  final int index;
  final int currIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 18.0,
      width: 18.0,
      duration: Duration(milliseconds: 375),
      color: (index == currIndex) ? Colors.black : Colors.transparent,
      child: Text(
        text,
        style: GoogleFonts.raleway(fontSize: 13.0),
      ),
    );
  }
}
