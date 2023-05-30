import 'package:covid_data_app/helpers/check_box_option.dart';
import 'package:flutter/material.dart';

import '../../../controller/form_singleton.dart';
import '../../../themes/app_colors.dart';

List<bool> _checkBoxValues = [false, false];

class Question4 extends StatefulWidget {
  const Question4({Key? key}) : super(key: key);

  @override
  State<Question4> createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  @override
  void initState() {
    //FormSingleton().formProvider.reset();
    FormSingleton().formProvider.validateForm([true]);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return (screenMode == Orientation.landscape)
        ? const _LandscapeScreen()
        : const _PortraitScreen();
  }
}

class _LandscapeScreen extends StatefulWidget {
  const _LandscapeScreen({Key? key}) : super(key: key);

  @override
  State<_LandscapeScreen> createState() => _LandscapeScreenState();
}

class _LandscapeScreenState extends State<_LandscapeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1.3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 24),
              child: Text(
                'Procurou estabelecimento de saúde quando teve\ncovid-19?',
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
                    value: _checkBoxValues[0],
                    onChanged: ((value) {
                      setState(() {
                        _checkBoxValues[0] = value!;
                        if (_checkBoxValues[0]) {
                          _checkBoxValues[1] = false;
                        }
                        FormSingleton().formProvider.verifyForm(_checkBoxValues);
                      });
                    })),
                Text(
                  'Sim',
                  style: AppColors.checkBoxTextStyle,
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    value: _checkBoxValues[1],
                    onChanged: ((value) {
                      setState(() {
                        _checkBoxValues[1] = value!;
                        if (_checkBoxValues[1]) {
                          _checkBoxValues[0] = false;
                        }
                        FormSingleton().formProvider.verifyForm(_checkBoxValues);
                        FormSingleton().formProvider.validateForm([true]);
                      });
                    })),
                Text(
                  'Não',
                  style: AppColors.checkBoxTextStyle,
                )
              ],
            ),
            (_checkBoxValues[0])
                ? const _Estabelecimentos()
                : Container(),
          ],
        ),
      ),
    );
  }
}

class _PortraitScreen extends StatefulWidget {
  const _PortraitScreen({Key? key}) : super(key: key);

  @override
  State<_PortraitScreen> createState() => _PortraitScreenState();
}

class _PortraitScreenState extends State<_PortraitScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 24),
          child: Text(
            'Procurou estabelecimento\nde saúde quando teve\ncovid-19?',
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
                value: _checkBoxValues[0],
                onChanged: ((value) {
                  setState(() {
                    _checkBoxValues[0] = value!;
                    if (_checkBoxValues[0]) {
                      _checkBoxValues[1] = false;
                    }
                    FormSingleton().formProvider.verifyForm(_checkBoxValues);
                  });
                })),
            Text(
              'Sim',
              style: AppColors.checkBoxTextStyle,
            )
          ],
        ),
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: _checkBoxValues[1],
                onChanged: ((value) {
                  setState(() {
                    _checkBoxValues[1] = value!;
                    if (_checkBoxValues[1]) {
                      _checkBoxValues[0] = false;
                    }
                    FormSingleton().formProvider.verifyForm(_checkBoxValues);
                    FormSingleton().formProvider.validateForm([true, false]);
                  });
                })),
            Text(
              'Não',
              style: AppColors.checkBoxTextStyle,
            )
          ],
        ),
        (_checkBoxValues[0])
            ? const _Estabelecimentos()
            : Container()
      ],
    );
  }
}

class _Estabelecimentos extends StatefulWidget {
  const _Estabelecimentos({Key? key}) : super(key: key);

  @override
  State<_Estabelecimentos> createState() => _EstabelecimentosState();
}

class _EstabelecimentosState extends State<_Estabelecimentos> {
  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 16, top: 16),
          child: Text(
            'Quais estabelecimentos?',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Color(0xff000000),
              letterSpacing: 0.216,
              height: 1.5,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ),
        (screenMode == Orientation.landscape)
            ? const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckBoxOption(option: 'Hospital'),
                      CheckBoxOption(option: 'Unidade Básica de Saúde (UBS)'),
                      CheckBoxOption(option: 'UPA'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckBoxOption(option: 'Consultório particular'),
                      CheckBoxOption(option: 'Farmácia'),
                      CheckBoxOption(option: 'Laboratório Particular')
                    ],
                  )
                ],
              )
            :  const Column(
                children: [
                  CheckBoxOption(option: 'Hostpital'),
                  CheckBoxOption(option: 'Unidade Básica de Saúde (UBS)'),
                  CheckBoxOption(option: 'UPA'),
                  CheckBoxOption(option: 'Consultório particular'),
                  CheckBoxOption(option: 'Farmácia'),
                  CheckBoxOption(option: 'Laboratório Particular'),
                ],
              )
      ],
    );
  }
}