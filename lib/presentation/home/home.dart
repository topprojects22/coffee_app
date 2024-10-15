import 'package:flutter/material.dart';
import 'package:boilerplate/core/widgets/homeMainContainer/home_main_container.dart';
import 'package:boilerplate/core/widgets/platform/text/text_ui.dart';

import 'package:boilerplate/core/widgets/platform/image/image_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/backGround_1.png'),
              ),
            ),
            alignment: Alignment.topCenter,
            // color: AppColors.brown[50],
            child: const Positioned(
              top: 200,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: null,
              ),
            ),
          ),
          const SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUi(
                  title: 'Coffee Cup App',
                  type: TextType.titleLarge,
                  color: Colors.white,
                  isCustomTitle: true,
                ),
                SizedBox(height: 20),
                BaseInfoBlock(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
