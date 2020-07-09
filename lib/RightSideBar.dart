import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RightSideBar extends StatelessWidget {
  final double height;
  RightSideBar(this.height);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        //color: Colors.blue,
        height: height,
        width: 80.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Transform.rotate(
                angle: pi + pi / 2,
                child: Container(
                  height: 120.0,
                  child: Center(
                    child: Text(
                      'AXIS  STUDIO',
                      style: GoogleFonts.josefinSans(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
