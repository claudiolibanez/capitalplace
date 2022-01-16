import 'package:flutter/material.dart';

// constants
import 'package:capitalplace/src/core/constants/app_constants.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final TextStyle? typography;
  final bool isLoading;
  final VoidCallback? onPressed;
  final Color? background;
  final BorderSide? side;
  final double iconSize;
  final Widget? leading;
  final Widget? trailing;

  const ButtonWidget({
    Key? key,
    required this.title,
    this.typography,
    this.isLoading = false,
    this.onPressed,
    this.background = AppColorConstants.primary,
    this.side,
    this.iconSize = 22.0,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: isLoading
          ? const SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColorConstants.white,
                ),
                strokeWidth: 2.0,
              ),
            )
          : Row(
              mainAxisAlignment: leading != null || trailing != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leading != null)
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: leading!,
                  ),
                if (trailing != null)
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  child: Text(
                    title,
                    style: typography ?? AppTypographyConstants.button,
                    textAlign: TextAlign.center,
                  ),
                ),
                if (leading != null)
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                  ),
                if (trailing != null)
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: trailing!,
                  ),
              ],
            ),
      style: ElevatedButton.styleFrom(
        primary: background ?? AppColorConstants.primary,
        padding: const EdgeInsets.all(
          18.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        side: side,
        onSurface: Colors.grey,
      ),
      onPressed: onPressed,
    );
  }
}
