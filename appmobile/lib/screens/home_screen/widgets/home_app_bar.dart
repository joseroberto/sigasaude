import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget{
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      leadingWidth: 80,
      titleSpacing: 0,
      leading:  IconButton(
        style: IconButton.styleFrom(
          maximumSize: const Size(50, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          side: const BorderSide(
              width: 1,
              color: Color.fromRGBO(196, 197, 198, 1)),
        ),
        onPressed: () {},
        icon: Image.asset('assets/images/home_plus_outline.png'),
      ),
      title: const _Title(),
      actions: const [
        _Actions()
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: Color(0xff000000),
              letterSpacing: 0.108,
              height: 2,
            ),
            children: [
              TextSpan(
                text: 'UPA II',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: ' - DF-075, Km 180',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          textHeightBehavior:
          TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
        Text(
          'EPNB - Brasília - DF, 71705-510',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 8,
            color: Color(0x99000000),
            letterSpacing: 0.054,
            height: 2.83,
          ),
          textHeightBehavior:
          TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.notifications,
              color: AppColors.backgroundColor,
            ),
          ),
          InkWell(
            onTap: (() {Navigator.pushNamed(context, 'profile');}),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.containerBackgroundColor),
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}



