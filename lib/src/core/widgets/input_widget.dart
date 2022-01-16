import 'package:capitalplace/src/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool obscureText;
  final void Function(String value)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? textEditingController;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final String? Function(String? value)? validator;
  final int? maxLength;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  const InputWidget({
    Key? key,
    this.label,
    this.hint,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.textEditingController,
    this.readOnly = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.maxLength,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              label!,
              style: AppTypographyConstants.label.copyWith(
                color: AppColorConstants.white,
              ),
            ),
          ),
        const SizedBox(
          height: 8.0,
        ),
        TextFormField(
          focusNode: focusNode,
          maxLength: maxLength,
          controller: textEditingController,
          onChanged: onChanged,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTypographyConstants.hint.copyWith(
              color: AppColorConstants.white.withOpacity(.4),
            ),
            // labelText: widget.labelText,
            // labelStyle: AppTypographyConstants.labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: AppColorConstants.primary.withOpacity(.5),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide(
                width: 1,
                color: AppColorConstants.transparent,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide(
                width: 1,
                color: AppColorConstants.border,
              ),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(18.0),
            errorText: errorText,
          ),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: AppTypographyConstants.body.copyWith(
            color: AppColorConstants.white,
          ),
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
