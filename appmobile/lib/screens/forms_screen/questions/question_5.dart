import 'package:covid_data_app/controller/form_provider.dart';
import 'package:covid_data_app/controller/form_singleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../helpers/check_box_option.dart';
import '../../../themes/app_colors.dart';

List<bool> _checkBoxValues = [false, false];

class Question5 extends StatefulWidget {
  const Question5({Key? key}) : super(key: key);

  @override
  State<Question5> createState() => _Question5State();
}

class _Question5State extends State<Question5> {

  @override
  void initState() {
    //FormSingleton().formProvider.reset();
    FormSingleton().formProvider.validateForm([false]);
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
          padding: EdgeInsets.only(left: 16.0, bottom: 24, top: 0),
          child: Text(
            'A confirmação da doença\nse deu por meio de testes\nlaboratoriais?',
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
            ? const _CovidTests()
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
  double height = 0;

  @override
  Widget build(BuildContext context) {
    if(FormSingleton().formProvider.changed || FormSingleton().formProvider.isAllChecked) {
      setState(() {
        height = MediaQuery.of(context).size.height * 1.4;
      });
    } else {
      setState(() {
        height = MediaQuery.of(context).size.height * .9;
      });
    }
    return Consumer<FormProvider>(
      builder: (context, value, _) {
        return SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 8, top: 0),
                  child: Text(
                    'A confirmação da doença se deu por meio de testes\nlaboratoriais?',
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
                            FormSingleton().formProvider.change();
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
                    ? const _CovidTests()
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }
}



class _CovidTests extends StatefulWidget {
  const _CovidTests({Key? key}) : super(key: key);

  @override
  State<_CovidTests> createState() => _CovidTestsState();
}

class _CovidTestsState extends State<_CovidTests> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 24, top: 32),
          child: Text(
            'Qual dos testes abaixo?',
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
        CheckBoxOption(option: 'Teste Rápido'),
        CheckBoxOption(option: 'RT-PCR'),
        Padding(
          padding: EdgeInsets.fromLTRB(14.0, 40, 14.0, 0),
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                color: Color(0xff999999),
                letterSpacing: 0.09,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text:
                  'Casos confirmados de covid-19   até 30 de outubro de 2022 por: CRITÉRIO CLÍNICO, CRITÉRIO CLÍNICO-IMAGEM, CRITÉRIO CLÍNICO-EPIDEMIOLÓGICO, CRITÉRIO LABORATORIAL.  A partir do dia 31 de outubro de 2022 somente por dois critérios: CRITÉRIO LABORATORIAL e CLÍNICO-EPIDEMIOLÓGICO- Caso de SG ou SRAG com histórico de contato próximo ou domiciliar, nos 07 dias anteriores ao aparecimento dos sinais e sintomas com caso confirmado para covid-19 (Ministério da Saúde- ',
                ),
                TextSpan(
                  text: 'NOTA TÉCNICA Nº 14/2022-CGGRIPE/DEIDT/SVS/MS).',
                  style: TextStyle(
                    color: Color(0xff004cff),
                  ),
                ),
              ],
            ),
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
          ),
        )
      ],
    );
  }
}


