import 'package:flutter/material.dart';

// constants
import 'package:capitalplace/src/core/constants/app_constants.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const IconButtonWidget({
    Key? key,
    required this.iconData,
    this.onTap,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 38.0,
        height: 38.0,
        child: Icon(
          iconData,
          color: color ?? AppColorConstants.black,
          size: size ?? 18,
        ),
      ),
      onTap: onTap,
    );
  }
}
