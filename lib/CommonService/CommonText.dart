import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonText extends StatelessWidget {
  final size;
  final label;
  final fontw8;
  final overflow;
  final maxline;
  final colorT;

  const CommonText(
      {super.key,
      this.size,
      this.label,
      this.overflow,
      this.maxline,
      this.fontw8,
      this.colorT});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.oxygen(
        color: colorT,
        fontSize: size,
        fontWeight: fontw8,
      ),
      maxLines: maxline,
      overflow: overflow,
    );
  }
}
