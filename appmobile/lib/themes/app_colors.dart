import 'package:covid_data_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppColors {
  static Color backgroundColor = const Color.fromRGBO(0, 80, 159, 1);
  static Color containerBackgroundColor = const Color.fromRGBO(0, 125, 248, 1);

  static ButtonStyle buttonStyleNoColor = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13.0),
      side: const BorderSide(width: 2, color: Color.fromRGBO(196, 197, 198, 1)),
    ),
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
  );

  static TextStyle checkBoxTextStyle = const TextStyle(
  fontFamily: 'Poppins',
  fontSize: 18,
  color: Color(0xff000000),
  letterSpacing: 0.16199999999999998,
  height: 1.3333333333333333,
  );

  Widget closeButtonWithAction(Function() function) {
    return IconButton(
      style: IconButton.styleFrom(
        fixedSize: const Size(25, 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        side: const BorderSide(
            width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
      ),
      onPressed: () {
        function();
      },
      icon: const Icon(Icons.close),
    );
  }

  Widget backButtonWithAction(Function() function) {
    return IconButton(
      style: IconButton.styleFrom(
        fixedSize: const Size(25, 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        side: const BorderSide(
            width: 1,
            color: Color.fromRGBO(196, 197, 198, 1)),
      ),
      onPressed: () {
        function();
      },
      icon: SizedBox(
        width: 7.0,
        height: 12.0,
        child: SvgPicture.string(
          _svg_arrow,
          allowDrawingOutsideViewBox: true,
        ),
      ),
    );
  }

  static IconButton closeButton = IconButton(
    style: IconButton.styleFrom(
      fixedSize: const Size(25, 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      side: const BorderSide(
          width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
    ),
    onPressed: () {
      Navigator.pop(navigatorKey!.currentContext!);
    },
    icon: const Icon(Icons.close),
  );

  static IconButton backButton = IconButton(
    style: IconButton.styleFrom(
      fixedSize: const Size(25, 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(196, 197, 198, 1)),
    ),
    onPressed: () {
      Navigator.pop(navigatorKey!.currentContext!);
    },
    icon: SizedBox(
      width: 7.0,
      height: 12.0,
      child: SvgPicture.string(
        _svg_arrow,
        allowDrawingOutsideViewBox: true,
      ),
    ),
  );

  static TextStyle titleTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    color: Color(0xff000000),
    letterSpacing: 0.21599999999999997,
    height: 1.5,
  );

  static TextStyle onBoardingTitleTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    color: Color(0xff000000),
    letterSpacing: -0.24,
    fontWeight: FontWeight.w500,
    height: 1.3333333333333333,
  );

  static TextStyle onBoardingSubTitleTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    color: Color(0xff999999),
    letterSpacing: -0.16,
    height: 1.375,
  );

  static ButtonStyle buttonStyleWithColor = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
        side:
            const BorderSide(width: 2, color: Color.fromRGBO(196, 197, 198, 1)),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black);

  static ButtonStyle buttonStyleBlue = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
      ),
      backgroundColor: const Color.fromRGBO(0, 80, 159, 1),
      foregroundColor: Colors.white);
}

const String _svg_arrow =
    '<svg viewBox="8.0 6.0 7.4 12.0" ><path transform="translate(8.0, 6.0)" d="M 7.400000095367432 1.409999966621399 L 5.991903305053711 0 L 0 6 L 5.991903305053711 12 L 7.400000095367432 10.59000015258789 L 2.826180696487427 6 L 7.400000095367432 1.409999966621399 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';

