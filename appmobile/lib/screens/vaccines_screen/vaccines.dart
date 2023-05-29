import 'package:covid_data_app/screens/vaccines_screen/widgets/vaccines_list.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../themes/app_colors.dart';

class VaccinesScreen extends StatelessWidget {
  const VaccinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: AppColors.backButton,
        title: Text(
          'Minhas Vacinas',
          style: AppColors.titleTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              style: IconButton.styleFrom(
                fixedSize: const Size(25, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                side: const BorderSide(
                    width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
              ),
              onPressed: () {},
              icon: Image.asset('assets/images/icon_list.png'),
            ),
          )
        ],
      ),
      body: const VaccinesList(),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
      //   child: SizedBox(
      //     width: MediaQuery.of(context).size.width * .7,
      //     height: 60,
      //     child: ElevatedButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       style: ElevatedButton.styleFrom(
      //         backgroundColor: const Color(0xff00509f),
      //         foregroundColor: const Color(0xffffffff),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(14.0),
      //         ),
      //       ),
      //       child: const Text(
      //         'OK',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //           fontFamily: 'Poppins',
      //           fontSize: 18,
      //           color: Color(0xffffffff),
      //           letterSpacing: 0.1612,
      //           fontWeight: FontWeight.w500,
      //           height: 1,
      //         ),
      //         textHeightBehavior: TextHeightBehavior(
      //             applyHeightToFirstAscent: false),
      //         softWrap: false,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}