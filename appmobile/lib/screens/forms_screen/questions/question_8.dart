import 'package:flutter/material.dart';

import '../../../controller/form_singleton.dart';
import '../../../themes/app_colors.dart';

class Question8 extends StatefulWidget {
  const Question8({Key? key}) : super(key: key);

  @override
  State<Question8> createState() => _Question8State();
}

class _Question8State extends State<Question8> {
  List<bool> checkBoxValues = [false, false];

  @override
  void initState() {
    //FormSingleton().formProvider.reset();
    FormSingleton().formProvider.validateForm([true]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 24, top: 0),
          child: Text(
            (screenMode == Orientation.landscape) ?  'Observou alguma alteração na sua saúde após ter sido\ndiagnosticado com covid-19' : 'Observou alguma alteração\nna sua saúde após ter sido\ndiagnosticado com\ncovid-19',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              color: Color(0xff000000),
              letterSpacing: 0.216,
              height: 1.5,
            ),
            textHeightBehavior:
            const TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: checkBoxValues[0],
                onChanged: ((value) {
                  setState(() {
                    checkBoxValues[0] = value!;
                    if (checkBoxValues[0]) {
                      checkBoxValues[1] = false;
                    }
                    FormSingleton().formProvider.verifyForm(checkBoxValues);
                  });
                })),
            Text('Sim', style: AppColors.checkBoxTextStyle,)
          ],
        ),
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: checkBoxValues[1],
                onChanged: ((value) {
                  setState(() {
                    checkBoxValues[1] = value!;
                    if (checkBoxValues[1]) {
                      checkBoxValues[0] = false;
                    }
                    FormSingleton().formProvider.verifyForm(checkBoxValues);
                  });
                })),
            Text('Não', style: AppColors.checkBoxTextStyle,)
          ],
        ),
      ],
    );
  }
}