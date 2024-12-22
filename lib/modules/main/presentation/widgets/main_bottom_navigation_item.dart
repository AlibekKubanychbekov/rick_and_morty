import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';

class MainBottomNavigationItem extends StatelessWidget {
  const MainBottomNavigationItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    super.key,
  });
  final String icon;
  final String label;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 24,
            child: Image.asset(
              icon,
              color: isActive ? AppColors.greenColor : AppColors.unSelectedClr,
              scale: 2.4,
            ),
          ),
          Text(
            label,
            style: TextStyle(
                color:
                    isActive ? AppColors.greenColor : AppColors.unSelectedClr),
          ),
        ],
      ),
    );
  }
}
