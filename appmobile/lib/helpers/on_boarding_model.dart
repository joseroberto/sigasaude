import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class OnBoardingModel extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;

  const OnBoardingModel(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
            imagePath,
          width: 280,
          height: 280,
          filterQuality: FilterQuality.high,
        ),
        Text(
          title,
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
          softWrap: false,
          style: AppColors.onBoardingTitleTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 48.0),
          child: Text(
            subTitle,
            style: AppColors.onBoardingSubTitleTextStyle,
            textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
