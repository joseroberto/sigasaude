import 'package:covid_data_app/controller/form_provider.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_1.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_10.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_11.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_2.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_4.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_3.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_5.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_6.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_7.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_8.dart';
import 'package:covid_data_app/screens/forms_screen/questions/question_9.dart';
import 'package:covid_data_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../agendar_consulta_screen/widgets/consulta_confirmada.dart';

class FormsScreen extends StatefulWidget {
  final String day;
  final String month;
  final String time;
  const FormsScreen({Key? key, required this.day, required this.month, required this.time}) : super(key: key);

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  List<Widget> pages = [
    const Question1(),
    const Question2(),
    const Question3(),
    const Question4(),
    const Question5(),
    const Question6(),
    const Question7(),
    const Question8(),
    const Question9(),
    const Question10(),
    const Question11()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 60,
        leadingWidth: 70,
        title: Text('${currentPage + 1} de 11', style: const TextStyle(fontSize: 14, fontFamily: 'Poppins',),),
        leading: AppColors().backButtonWithAction(() {
          pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
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
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pages.length,
        onPageChanged: ((page) {
          setState(() {
            currentPage = page;
          });
        }),
        itemBuilder: ((context, index) {
          return pages[index];
        }),
      ),
      bottomNavigationBar: Consumer<FormProvider>(
        builder: (context, formState, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              color: Colors.transparent,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  if(formState.isAllChecked && formState.isFormValid.value){
                    if((currentPage + 1) < 11) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return ConsultaConfirmadaScreen(day: widget.day, month: widget.month, time: widget.time,);
                      }));
                    }
                  }
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xff00509f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  side: const BorderSide(
                    width: 1.0,
                    color: Color(0x8f95989a),
                  ),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Color(0xffffffff),
                    letterSpacing: 0.162,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FormPage extends StatefulWidget {
  final String question;

  const _FormPage({Key? key, required this.question}) : super(key: key);

  @override
  State<_FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<_FormPage> {
  bool checkBox1Value = false;
  bool checkBox2Value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 24),
          child: Text(
            widget.question,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              color: Color(0xff000000),
              letterSpacing: 0.21599999999999997,
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
                value: checkBox1Value,
                onChanged: ((value) {
                  setState(() {
                    checkBox1Value = value!;
                    if (checkBox1Value) {
                      checkBox2Value = false;
                    }
                  });
                })),
            const Text('Sim')
          ],
        ),
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: checkBox2Value,
                onChanged: ((value) {
                  setState(() {
                    checkBox2Value = value!;
                    if (checkBox2Value) {
                      checkBox1Value = false;
                    }
                  });
                })),
            const Text('Não')
          ],
        ),
        const Expanded(
            child: SizedBox(
          height: 30,
        )),
      ],
    );
  }
}

class _ChekBoxPage extends StatefulWidget {
  final String question;

  const _ChekBoxPage({Key? key, required this.question}) : super(key: key);

  @override
  State<_ChekBoxPage> createState() => _ChekBoxPageState();
}

class _ChekBoxPageState extends State<_ChekBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 24),
          child: Text(
            widget.question,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              color: Color(0xff000000),
              letterSpacing: 0.21599999999999997,
              height: 1.5,
            ),
            textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ),
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: false,
                onChanged: ((value) {
                  setState(() {});
                })),
            const Text('Não')
          ],
        ),
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: false,
                onChanged: ((value) {
                  setState(() {});
                })),
            const Text('Não')
          ],
        ),
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: false,
                onChanged: ((value) {
                  setState(() {});
                })),
            const Text('Não')
          ],
        ),
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: false,
                onChanged: ((value) {
                  setState(() {});
                })),
            const Text('Não')
          ],
        ),
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: false,
                onChanged: ((value) {
                  setState(() {});
                })),
            const Text('Não')
          ],
        ),
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: false,
                onChanged: ((value) {
                  setState(() {});
                })),
            const Text('Não')
          ],
        ),
      ],
    );
  }
}
