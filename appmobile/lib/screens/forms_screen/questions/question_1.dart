import 'package:covid_data_app/controller/form_singleton.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';

List<bool> _checkBoxValues = [false, false, false];

class Question1 extends StatefulWidget {
  const Question1({Key? key}) : super(key: key);

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {

  @override
  void initState() {
    //_checkBoxValues = [false, false, false];
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
            'Quando recebeu alguma\ndas doses de vacina para\ncovid-19 neste ano?',
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
        Column(
          children: [
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
                          _checkBoxValues = [true, false, false];
                        }
                        FormSingleton().formProvider.verifyForm(_checkBoxValues);
                      });
                    })),
                Text('Menos de 4 meses', style: AppColors.checkBoxTextStyle,)
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
                          _checkBoxValues = [false, true, false];
                        }
                        FormSingleton().formProvider.verifyForm(_checkBoxValues);
                      });
                    })),
                Text('Mais de 6 meses', style: AppColors.checkBoxTextStyle,)
              ],
            ),
            Row(
              children: [
                Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    value: _checkBoxValues[2],
                    onChanged: ((value) {
                      setState(() {
                        _checkBoxValues[2] = value!;
                        if (_checkBoxValues[2]) {
                          _checkBoxValues = [false, false, true];
                        }
                        FormSingleton().formProvider.verifyForm(_checkBoxValues);
                      });
                    })),
                Text('Não tomei nenhuma dose', style: AppColors.checkBoxTextStyle,)
              ],
            ),
          ],
        )
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
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 24),
              child: Text(
                'Quando recebeu alguma das doses de vacina para\ncovid-19 neste ano?',
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
            Column(
              children: [
                Row(
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
                              _checkBoxValues[2] = false;
                            }
                            FormSingleton().formProvider.verifyForm(_checkBoxValues);
                          });
                        })),
                    Text('Menos de 4 meses', style: AppColors.checkBoxTextStyle,)
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
                              _checkBoxValues[2] = false;
                            }
                            FormSingleton().formProvider.verifyForm(_checkBoxValues);
                          });
                        })),
                    Text('Mais de 6 meses', style: AppColors.checkBoxTextStyle,)
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        value: _checkBoxValues[2],
                        onChanged: ((value) {
                          setState(() {
                            _checkBoxValues[2] = value!;
                            if (_checkBoxValues[2]) {
                              _checkBoxValues[0] = false;
                              _checkBoxValues[1] = false;
                            }
                            FormSingleton().formProvider.verifyForm(_checkBoxValues);
                          });
                        })),
                    Text('Não tomei nenhuma dose', style: AppColors.checkBoxTextStyle,)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

