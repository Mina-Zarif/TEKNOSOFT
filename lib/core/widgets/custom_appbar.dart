import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.action,
    this.leadingOnTap,
    this.titleOnTap,
    this.actionOnTap,
    this.backgroundColor = kBackgroundColor,
    this.elevation = 0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
  final Widget? leading, title, action;
  final Function()? leadingOnTap, titleOnTap, actionOnTap;
  final Color backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 20,
        bottom: 5,
        start: 12,
        end: 12,
      ),
      child: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        elevation: elevation,
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: leadingOnTap ?? () {},
          child: Center(child: leading ?? const SizedBox()),
        ),
        title: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: titleOnTap ?? () {},
          child: title ?? const SizedBox(),
        ),
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: actionOnTap ?? () {},
            child: action ?? const SizedBox(),
          ),
          const SizedBox(width: 5)
        ],
      ),
    );
  }
}
