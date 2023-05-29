import 'package:flutter/material.dart';

import '../../main.dart';
import '../../themes/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool checkBox1Value = false;
  bool checkBox2Value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leadingWidth: 80,
        leading: AppColors().backButtonWithAction(() => Navigator.pushReplacementNamed(context, 'auth')),
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    'Seus dados',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      color: Color(0xff000000),
                      letterSpacing: 0.21599999999999997,
                      height: 1.5,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: _FormItemText(
                      field: 'Seu nome completo', fieldValue: 'Seu nome'),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: _FormItemText(
                      field: 'Seu CPF?', fieldValue: '000.000.000-00'),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: _FormItemText(
                      field: 'Seu email', fieldValue: 'seuemail@xxxx.xxx'),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: _FormItemText(
                      field: 'Sua data de nascimento',
                      fieldValue: 'DD/MM/AAAA'),
                ),
                const _FormItemText(
                    field: 'Seu DDD + Telefone', fieldValue: '(00) 00000-0000'),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 48),
                  child: Text(
                    'Você irá receber um SMS para confirmação do\ntelefone informado.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Color(0xff666666),
                      letterSpacing: 0.10799999999999998,
                      height: 1.3333333333333333,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: _FormItemText(
                      field: 'N° Cartão Nacional de Saúde (SUS)',
                      fieldValue: '000.000.000-00'),
                ),
                const _FormItemCheckBox(
                    field: 'Grupo de riscos para Covid-19?'),
                const _FormItemCheckBox(
                    field:
                        'A informação é para você, ou para\n um menor de 18 anos'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Como a equipe de saúde pode entrar em\n contato com você',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
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
                        const Text('Meu Telefone'),
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
                        const Text('Outro')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: '(00) 00000-0000',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const _RegisterSuccessWidget();
                });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff00509f),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            elevation: 8,
          ),
          child: const SizedBox(
            width: 90.0,
            height: 25.0,
            child: Text(
              'Cadastrar',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: Color(0xffffffff),
                letterSpacing: -0.18,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}

class _FormItemCheckBox extends StatefulWidget {
  final String field;

  const _FormItemCheckBox({Key? key, required this.field}) : super(key: key);

  @override
  State<_FormItemCheckBox> createState() => _FormItemCheckBoxState();
}

class _FormItemCheckBoxState extends State<_FormItemCheckBox> {
  bool checkBox1Value = false;
  bool checkBox2Value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text.rich(
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
            TextSpan(
              text: widget.field,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Color(0xff000000),
                letterSpacing: 0.144,
                height: 1.5,
              ),
              children: const <TextSpan>[
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 48.0),
                child: Row(
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
                    const Text(
                      'Sim',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xff000000),
                        letterSpacing: 0.126,
                        height: 1.7142857142857142,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    )
                  ],
                ),
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
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _FormItemText extends StatelessWidget {
  final String field;
  final String fieldValue;

  const _FormItemText({Key? key, required this.field, required this.fieldValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Color(0xff000000),
              letterSpacing: 0.144,
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: field,
              ),
              const TextSpan(
                text: '*',
                style: TextStyle(
                  color: Color(0xffe74e00),
                ),
              ),
            ],
          ),
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: Color(0x7dacacac),
              letterSpacing: 0.10799999999999998,
              height: 1.5,
            ),
            hintText: fieldValue,
          ),
        )
      ],
    );
  }
}

class _RegisterSuccessWidget extends StatelessWidget {
  const _RegisterSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 30,),
          Image.asset(
            'assets/images/check.png',
            width: 400,
            height: 300,
            fit: BoxFit.cover,
          ),
          const Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                color: Color(0xff000000),
                letterSpacing: -0.24,
                height: 1.3333333333333333,
              ),
              children: [
                TextSpan(
                  text: 'Cadastro concluído \ncom ',
                ),
                TextSpan(
                  text: 'sucesso',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: '!',
                ),
              ],
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
          const Text(
            'Agora você pode acessar a\n plataforma para fazer agendamentos\n'
            'e ter na palma da mão, informações\n importantes para você!',
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            softWrap: false,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Color(0xff999999),
              letterSpacing: -0.16,
              height: 1.375,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 17.0),
            child: SizedBox(
              width: width * .9,
              height: 60,
              child: ElevatedButton(
                onPressed: (() {
                  Navigator.pushReplacementNamed(context, 'home');
                }),
                style: AppColors.buttonStyleBlue,
                child: const Text(
                  'Vamos lá!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
