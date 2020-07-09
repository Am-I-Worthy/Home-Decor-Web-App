import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  final double height;
  final double width;

  FirstPage(this.height, this.width);

  @override
  _CenterPageState createState() => _CenterPageState();
}

class _CenterPageState extends State<FirstPage> {
  double containerTop = 0.0;
  double opacityHead = 0.0;
  double opacitySub = 0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        containerTop = widget.height;
      });
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        opacityHead = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1800), () {
      setState(() {
        opacitySub = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            right: 80.0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: widget.height,
              width: widget.width * 0.4,
              //color: Colors.blue,
              child: Image.network(
                'https://images.unsplash.com/photo-1556910638-6cdac31d44dc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80',
                fit: BoxFit.cover,
                alignment: Alignment(0.3, 0.0),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: containerTop,
            right: 78.0,
            child: AnimatedContainer(
              curve: Curves.ease,
              duration: Duration(milliseconds: 600),
              height: widget.height,
              width: widget.width * 0.41,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: widget.height * 0.240,
            left: 160.0,
            child: Container(
              height: widget.height,
              width: widget.width * 0.53,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 500),
                    opacity: opacityHead,
                    child: Text(
                      'Decoration is what you need for your House !',
                      style: GoogleFonts.ubuntu(
                          fontSize: 80.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  AnimatedOpacity(
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 500),
                    opacity: opacitySub,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur ',
                          style: GoogleFonts.raleway(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'adipiscing elit, sed do eiusmod tempor incididunt',
                          style: GoogleFonts.raleway(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'ut labore et',
                          style: GoogleFonts.raleway(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
