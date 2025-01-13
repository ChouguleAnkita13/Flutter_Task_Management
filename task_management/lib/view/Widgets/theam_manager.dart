import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  // TextStyles
  static TextStyle headlineLarge = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: cardColor,
  );

  static TextStyle headlineMedium = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: cardColor,
  );

  static TextStyle subHeadline = GoogleFonts.quicksand(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: primaryColor,
  );

  static TextStyle buttonTextStyle = GoogleFonts.poppins(
    fontSize: 21,
    fontWeight: FontWeight.w500,
    color: cardColor,
  );

  static TextStyle listItemTitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle listItemSubtitle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey[500],
  );

  static TextStyle listItemDate = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  // Colors
  static Color primaryColor = Colors.purple;
  static Color secondaryColor = Colors.grey[200]!;
  static Color backgroundColor = Colors.purple[400]!;
  static Color cardColor = Colors.white;
  static Color completedTaskColor = Colors.grey[100]!;
  static Color checkboxActiveColor = Colors.green[500]!;
  static Color borderColor = Colors.grey[200]!;

  // Container Decorations
  static BoxDecoration containerDecoration = BoxDecoration(
    color: borderColor,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    ),
  );

  static BoxDecoration cardDecoration(bool isDone) {
    return BoxDecoration(
      color: isDone ? completedTaskColor : cardColor,
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          offset: Offset(2, 10),
          blurRadius: 8,
        ),
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.08),
          offset: Offset(0, -4),
          blurRadius: 4,
        ),
      ],
    );
  }

  static BoxDecoration buttonDecoration = BoxDecoration(
    color: primaryColor,
    borderRadius: BorderRadius.circular(10),
  );

  static InputDecoration textFieldDecoration = InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: primaryColor, width: 0.5),
    ),
  );
}
