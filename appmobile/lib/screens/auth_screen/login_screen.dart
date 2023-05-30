import 'package:covid_data_app/screens/auth_screen/google_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:covid_data_app/helpers/search.dart';
import '../../themes/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 80,
        automaticallyImplyLeading: false,
        leading: AppColors().backButtonWithAction(() => Navigator.pushReplacementNamed(context, 'auth')),
      ),
      body: (screenMode == Orientation.landscape) ? const _LandscapeScreen() : const _PortraitScreen(),
    );
  }
}

class _LandscapeScreen extends StatelessWidget {
  const _LandscapeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 32),
                child: Text(
                  'Acesse sua conta',
                  textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                  style: AppColors.titleTextStyle,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    const Text(
                      'Seu E-mail ou CPF',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xff999999),
                        letterSpacing: 0.126,
                        height: 1.7142857142857142,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, top: 0),
                      child: TextFormField(),
                    ),
                    const Text(
                      'Sua Senha',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xff999999),
                        letterSpacing: 0.126,
                        height: 1.7142857142857142,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    Stack(
                      children: [
                        TextFormField(),
                        Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(MaterialCommunityIcons.eye_off_outline, color: Color(0xff999999),),
                            ))
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: InkWell(
                          onTap: (() {}),
                          child: const Text(
                            'Esqueci minha senha!',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              color: Color(0xff0088ff),
                              letterSpacing: 0.10799999999999998,
                              height: 2,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: _Divider(),
                    ),
                    SizedBox(
                      width: width * .9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _AlternateLoginOption(
                              icon: const SizedBox(
                                width: 28.3,
                                height: 28.3,
                                child: search(),
                              ),
                              onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 48.0),
                            child: _AlternateLoginOption(
                                icon: const Icon(
                                  MaterialCommunityIcons.facebook,
                                ),
                                onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
                          ),
                          _AlternateLoginOption(
                              icon: const Icon(
                                MaterialCommunityIcons.apple,
                                color: Colors.black,
                              ),
                              onTap: (() {GoogleLogin().showGoogleLoginDialog(context);}))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'splash');
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
                              'Vamos lá!',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Color(0xffffffff),
                                letterSpacing: -0.18,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 10,
                            color: Color(0xff000000),
                            letterSpacing: 0.09,
                            height: 1.4,
                          ),
                          children: [
                            TextSpan(
                              text: 'Ao cadastrar você estará de acordo com nossos',
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: 'Termos de uso',
                              style: TextStyle(
                                color: Color(0xff8080ff),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: ' e a nossa ',
                            ),
                            TextSpan(
                              text: 'Política de Privacidade',
                              style: TextStyle(
                                color: Color(0xff8080ff),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: '.',
                              style: TextStyle(
                                color: Color(0xff8080ff),
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PortraitScreen extends StatelessWidget {
  const _PortraitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              'Acesse sua conta',
              textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
              style: AppColors.titleTextStyle,
            ),
          ),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Seu E-mail ou CPF',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xff999999),
                    letterSpacing: 0.126,
                    height: 1.7142857142857142,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 0),
                  child: TextFormField(),
                ),
                const Text(
                  'Sua Senha',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xff999999),
                    letterSpacing: 0.126,
                    height: 1.7142857142857142,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                Stack(
                  children: [
                    TextFormField(),
                    Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: (() {}),
                          icon: const Icon(MaterialCommunityIcons.eye_off_outline, color: Color(0xff999999),),
                        ))
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      onTap: (() {}),
                      child: const Text(
                        'Esqueci minha senha!',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: Color(0xff0088ff),
                          letterSpacing: 0.10799999999999998,
                          height: 2,
                        ),
                        textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                const _Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _AlternateLoginOption(
                          icon: const SizedBox(
                            width: 28.3,
                            height: 28.3,
                            child: search(),
                          ),
                          onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
                      _AlternateLoginOption(
                          icon: const Icon(
                            MaterialCommunityIcons.facebook,
                          ),
                          onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
                      _AlternateLoginOption(
                          icon: const Icon(
                            MaterialCommunityIcons.apple,
                            color: Colors.black,
                          ),
                          onTap: (() {GoogleLogin().showGoogleLoginDialog(context);}))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'splash');
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
                          'Vamos lá!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color(0xffffffff),
                            letterSpacing: -0.18,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ),
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 10,
                      color: Color(0xff000000),
                      letterSpacing: 0.09,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: 'Ao cadastrar você estará de acordo com nossos',
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: 'Termos de uso',
                        style: TextStyle(
                          color: Color(0xff8080ff),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: '.\ne a nossa ',
                      ),
                      TextSpan(
                        text: 'Política de Privacidade',
                        style: TextStyle(
                          color: Color(0xff8080ff),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                          color: Color(0xff8080ff),
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
          ),
        ],
      ),
    );
  }
}



class _AlternateLoginOption extends StatelessWidget {
  final Widget icon;
  final Function() onTap;

  const _AlternateLoginOption(
      {Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(80, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          side: const BorderSide(width: 1.0, color: Color(0xff999999)),
        ),
        onPressed: onTap,
        child: icon);
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'ou',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
