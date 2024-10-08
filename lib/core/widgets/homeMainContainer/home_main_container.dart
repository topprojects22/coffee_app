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
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: AppColors.orange[50]!.withOpacity(0.3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextUi(
                    title: 'home_start_description_ru',
                    type: TextType.titleMedium,
                  ),
                  const SizedBox(height: 40),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: 'home_start_ru',
                    textColor: Colors.white,
                    borderRadius: 25,
                    backgroundColor: AppColors.brown[50],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
