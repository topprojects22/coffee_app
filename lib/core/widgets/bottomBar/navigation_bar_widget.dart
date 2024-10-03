import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  final int selectedIndex;
  final onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavBarItem(CupertinoIcons.home, 'Home', 0),
          buildNavBarItem(CupertinoIcons.list_bullet, 'My Task', 1),
          const SizedBox(width: 20),
          buildNavBarItem(CupertinoIcons.conversation_bubble, 'Message', 3),
          buildNavBarItem(CupertinoIcons.profile_circled, 'Profile', 4),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            weight: 50,
            color: selectedIndex == index
                ? const Color(0xFF7861FF)
                : Colors.black87,
          ),
          Text(
            label,
            style: TextStyle(
              color: selectedIndex == index
                  ? const Color(0xFF7861FF)
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
