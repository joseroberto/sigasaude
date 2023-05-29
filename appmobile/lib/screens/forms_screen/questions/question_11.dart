import 'package:covid_data_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../controller/form_singleton.dart';

List<bool> _checkBoxValues = [false, false];

class Question11 extends StatefulWidget {
  const Question11({Key? key}) : super(key: key);

  @override
  State<Question11> createState() => _Question11State();
}

class _Question11State extends State<Question11> {
  @override
  void initState() {
    //FormSingleton().formProvider.reset();
    FormSingleton().formProvider.validateForm([true]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery
        .of(context)
        .orientation;
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
          padding: EdgeInsets.only(left: 16.0, bottom: 24, top: 0),
          child: Text(
            'Gostaria de agendar uma\nconsulta na sua Unidade\nde Saúde?',
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
                      Navigator.pushNamed(context, 'agendar_consulta');
                    }
                    FormSingleton().formProvider.verifyForm(_checkBoxValues);
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
                  });
                })),
            Text('Não', style: AppColors.checkBoxTextStyle,)
          ],
        ),
        const _UbsCard()
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
        height: MediaQuery.of(context).size.height * 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 24, top: 0),
              child: Text(
                'Gostaria de agendar uma\nconsulta na sua Unidade\nde Saúde?',
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
                          Navigator.pushNamed(context, 'agendar_consulta');
                        }
                        FormSingleton().formProvider.verifyForm(_checkBoxValues);
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
                      });
                    })),
                Text('Não', style: AppColors.checkBoxTextStyle,)
              ],
            ),
            const _UbsCard()
          ],
        ),
      ),
    );
  }
}


class _UbsCard extends StatelessWidget {
  const _UbsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(22.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(237, 240, 242, 1),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'UBS 06',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color(0xff2c3e50),
                      letterSpacing: 0.14400000000000002,
                      fontWeight: FontWeight.w600,
                      height: 0.7777777777777778,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xff2c3e50),
                      letterSpacing: 0.128,
                      height: 1.1666666666666667,
                    ),
                    children: [
                      TextSpan(
                        text:
                        'DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 0.096,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
            ),
            IconButton(
              style: IconButton.styleFrom(
                maximumSize: const Size(50, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: const BorderSide(
                    width: 1,
                    color: Color.fromRGBO(196, 197, 198, 1)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'locations');
              },
              icon: const Icon(MaterialCommunityIcons.pencil_outline),
            ),
          ],
        ),
      ),
    );
  }
}

