import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget {
  final double height;
  final double width;

  SecondPage(this.height, this.width);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  static double titleOpacity = 0.0;
  double containerTop1 = 0.0;
  double sectionOpacity2 = 0.0;
  double sectionTop2 = 0.0;
  double sectionOpacity3 = 0.0;
  double sectionBottom3 = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1600), () {
      setState(() {
        titleOpacity = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1800), () {
      setState(() {
        containerTop1 = widget.height;
      });
    });
    Future.delayed(Duration(milliseconds: 2200), () {
      setState(() {
        sectionTop2 = widget.height;
      });
    });
    Future.delayed(Duration(milliseconds: 2600), () {
      setState(() {
        sectionOpacity2 = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        sectionOpacity3 = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 3400), () {
      setState(() {
        sectionBottom3 = widget.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 160.0, right: 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: widget.height,
            width: widget.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  opacity: titleOpacity,
                  text: 'About',
                  fontWeight: FontWeight.w600,
                  fontsize: 55.0,
                ),
                SizedBox(height: 25.0),
                CustomImage(
                  widget: widget,
                  image:
                      'https://images.unsplash.com/photo-1521321386883-67b97e3a0aa4?ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80',
                  heightFrac: 0.7,
                  widthFrac: 0.35,
                  animatedPositionedValue: containerTop1,
                  topOrBottom: 'top',
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40.0),
            height: widget.height,
            width: widget.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  widget: widget,
                  heightFrac: 0.65,
                  widthFrac: 0.25,
                  image:
                      'https://images.unsplash.com/photo-1509744645300-a2098b11871a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80',
                  animatedPositionedValue: sectionTop2,
                  topOrBottom: 'bottom',
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomText(
                  opacity: sectionOpacity2,
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
                  height: 1.8,
                  fontsize: 13.0,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            height: widget.height,
            width: widget.width * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  opacity: sectionOpacity3,
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
                  height: 1.8,
                  fontsize: 13.0,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomImage(
                  widget: widget,
                  image:
                      'https://images.unsplash.com/photo-1513491952389-d52ceeb8c9d3?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
                  heightFrac: 0.35,
                  widthFrac: 0.15,
                  animatedPositionedValue: sectionBottom3,
                  topOrBottom: 'top',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    @required this.opacity,
    this.fontWeight,
    this.fontsize,
    this.text,
    this.height,
  });

  final double opacity;
  final String text;
  final FontWeight fontWeight;
  final double fontsize;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
          height: height,
          fontSize: fontsize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    @required this.widget,
    this.topOrBottom,
    this.image,
    this.heightFrac,
    this.widthFrac,
    this.animatedPositionedValue,
  });

  final SecondPage widget;
  final String topOrBottom;
  final String image;
  final double heightFrac;
  final double widthFrac;
  final double animatedPositionedValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 2.0, left: 2.0, right: 2.0, bottom: 2.0),
          height: widget.height * heightFrac,
          width: widget.width * widthFrac,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 600),
          bottom: (topOrBottom == 'bottom') ? animatedPositionedValue : null,
          top: (topOrBottom == 'top') ? animatedPositionedValue : null,
          child: Container(
            height: widget.height * heightFrac,
            width: widget.width * widthFrac,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
