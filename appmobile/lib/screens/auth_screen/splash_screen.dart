import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: const Color.fromRGBO(0, 80, 159, 1),
        padding: const EdgeInsets.all(40.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            Image.asset('assets/images/siga_saude_logo.png'),
            Image.asset('assets/images/siga_saude_branding.png'),
          ],
        ),
      ),
    );
  }
}
