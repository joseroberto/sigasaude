import 'package:covid_data_app/controller/form_singleton.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

List<bool> _checkBoxValues = [false, false];
List<bool> _checkBoxList = [false, false, false, false];

class Question2 extends StatefulWidget {
  const Question2({Key? key}) : super(key: key);

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  bool checkBox1Value = false;
  bool checkBox2Value = false;

  @override
  void initState() {
    //FormSingleton().formProvider.reset();
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
            'Você teve covid-19 de 2020\naté hoje?',
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
                    FormSingleton().formProvider.verifyForm(_checkBoxList);
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
                value: _checkBoxValues[1],
                onChanged: ((value) {
                  setState(() {
                    _checkBoxValues[1] = value!;
                    if (_checkBoxValues[1]) {
                      _checkBoxValues[0] = false;
                    }
                    _checkBoxList = [false, false, false, false];
                    FormSingleton().formProvider.verifyForm(_checkBoxValues);
                  });
                })),
            Text('Não', style: AppColors.checkBoxTextStyle,)
          ],
        ),
        (_checkBoxValues[0])
            ? const _QtdCovid()
            : Container(),
      ],
    );
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 24),
              child: Text(
                'Você teve covid-19 de 2020\naté hoje?',
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
                    value: _checkBoxValues[1],
                    onChanged: ((value) {
                      setState(() {
                        _checkBoxValues[1] = value!;
                        if (_checkBoxValues[1]) {
                          _checkBoxValues[0] = false;
                        }
                        FormSingleton().formProvider.verifyForm(_checkBoxValues);
                        _checkBoxList = [false, false, false, false];
                      });
                    })),
                Text('Não', style: AppColors.checkBoxTextStyle,)
              ],
            ),
            (_checkBoxValues[0])
                ? const _QtdCovid()
                : Container(),
          ],
        ),
      ),
    );
  }
}

class _QtdCovid extends StatefulWidget {
  const _QtdCovid({Key? key}) : super(key: key);

  @override
  State<_QtdCovid> createState() => _QtdCovidState();
}

class _QtdCovidState extends State<_QtdCovid> {

  @override
  void initState() {
    _checkBoxList = [false, false, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 24, top: 16),
            child: Text(
              'Quantas vezes?',
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
            children: [
              IconButton(
                  onPressed: (() {
                    setState(() {
                      _checkBoxList = [true, false, false, false];
                      FormSingleton().formProvider.verifyForm(_checkBoxList);
                      FormSingleton().formProvider.validateForm([true]);
                    });
                  }),
                  icon: (_checkBoxList[0])
                      ? const Icon(Icons.check_box)
                      : const Icon(Icons.check_box_outline_blank)),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  '1 vez',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: (() {
                    setState(() {
                      _checkBoxList = [false, true, false, false];
                      FormSingleton().formProvider.verifyForm(_checkBoxList);
                      FormSingleton().formProvider.validateForm([true]);
                    });
                  }),
                  icon: (_checkBoxList[1])
                      ? const Icon(Icons.check_box)
                      : const Icon(Icons.check_box_outline_blank)),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  '2 vezes',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: (() {
                    setState(() {
                      _checkBoxList = [false, false, true, false];
                      FormSingleton().formProvider.verifyForm(_checkBoxList);
                      FormSingleton().formProvider.validateForm([true]);
                    });
                  }),
                  icon: (_checkBoxList[2])
                      ? const Icon(Icons.check_box)
                      : const Icon(Icons.check_box_outline_blank)),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  '3 vezes',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: (() {
                    setState(() {
                      _checkBoxList = [false, false, false, true];
                      FormSingleton().formProvider.verifyForm(_checkBoxList);
                      FormSingleton().formProvider.validateForm([true]);
                    });
                  }),
                  icon: (_checkBoxList[3])
                      ? const Icon(Icons.check_box)
                      : const Icon(Icons.check_box_outline_blank)),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'mais de 4 vezes',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
