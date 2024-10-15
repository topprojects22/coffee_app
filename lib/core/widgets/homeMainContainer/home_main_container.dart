import 'package:boilerplate/core/widgets/platform/image/image_ui.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/core/widgets/platform/button/button_ui.dart';
import 'package:boilerplate/core/widgets/platform/text/text_ui.dart';

class BaseInfoBlock extends StatelessWidget {
  const BaseInfoBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/small_coffee_cup_up.png',),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 400),
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'home_start_ru',
                  textColor: AppColors.orange[50],
                  borderRadius: 25,
                  backgroundColor: AppColors.brown[50],
                  side: const BorderSide(width: 1, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
