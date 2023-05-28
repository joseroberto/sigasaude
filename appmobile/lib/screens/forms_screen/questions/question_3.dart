import 'package:flutter/material.dart';
import '../../../controller/form_singleton.dart';
import '../../../themes/app_colors.dart';

class Question3 extends StatefulWidget {
  const Question3({Key? key}) : super(key: key);

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  List<bool> checkBoxValues = [false, false];

  @override
  void initState() {
    //FormSingleton().formProvider.reset();
    FormSingleton().formProvider.validateForm([true]);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 24, top: 0),
          child: Text(
            'Coletou exame para\nconfirmação da covid-19?',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              color: Color(0xff000000),
              letterSpacing: 0.216,
              height: 1.5,
            ),
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
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
