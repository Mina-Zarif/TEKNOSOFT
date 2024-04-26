import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomSettingsItem extends StatelessWidget {
  const CustomSettingsItem({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.text,
  });

  final Function() onTap;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.grey[100],
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey[200],
            ),
            child: Icon(
              iconData,
              size: 24,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: Styles.textStyle20.copyWith(
              fontSize: 16.5,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
