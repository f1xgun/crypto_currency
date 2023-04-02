import 'package:crypto_currency/app_styles.dart';
import 'package:crypto_currency/size_config.dart';
import 'package:flutter/material.dart';

class PageOfOnboarding extends StatelessWidget {
  const PageOfOnboarding(
      {super.key,
      required this.urlImage,
      required this.title,
      required this.subtitle});

  final String urlImage;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image:
                  AssetImage('assets/images/onboarding_screen/$urlImage.png'),
              width: 300,
              height: 300,
            ),
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 50,
            child: Text(
              title,
              style: kQuestrialBold.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 3,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 50,
            child: Text(
              subtitle,
              style: kQuestrialMedium.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 2,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
