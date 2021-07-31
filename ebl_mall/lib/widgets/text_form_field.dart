import 'package:ebl_mall/style/style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class InputWidget extends StatelessWidget {
  //
  final TextInputType? textInputType;
  final String? emptyMsg;
  final String? hint;
  final String? lableTxt;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool? autofocus;
  final bool? isShowBuildCounter;
  final ValueChanged? onChange;
  final Function? changeValueObScureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsets? margin;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final double? fontSize;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final Color? color;
  final void Function()? onTap;
  final String? prefixText;
  //
  const InputWidget({
    Key? key,
    this.emptyMsg,
    this.hint,
    this.obscureText,
    this.lableTxt,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.onChange,
    this.autovalidateMode,
    this.validator,
    this.margin,
    this.textInputType,
    this.changeValueObScureText,
    this.suffixIcon,
    this.prefixIcon,
    this.height,
    this.contentPadding,
    this.textStyle,
    this.onFieldSubmitted,
    this.color,
    this.fontSize,
    this.onTap,
    this.autofocus,
    this.isShowBuildCounter,
    this.prefixText,
  }) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    //
    return TextFormField(
      controller: controller,
      autofocus: autofocus ?? false,
      maxLength: maxLength ?? 80,
      maxLines: maxLines ?? 1,
      keyboardType: textInputType,
      textAlign: TextAlign.right,
      // textDirection: TextDirection.ltr,
      buildCounter: (BuildContext context,
          {int? currentLength, int? maxLength, bool? isFocused}) {
        // return isShowBuildCounter == true
        //     ? myTinyString(currentLength.toString())
        //     : null;
      },
      // buildCounter: (BuildContext context,
      //         {int currentLength, int maxLength, bool isFocused}) =>
      //     null,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: validator,
      // validator: validator ?? ValidatorClass.generalValidation,
      onChanged: onChange,
      style: textStyle,
      onTap: onTap ?? null,
      onFieldSubmitted: (value) {
        // FocusScope.of(context).requestFocus(FocusNode());
      },
      //
      decoration: InputDecoration(
        isDense: true,
        prefixText: prefixText ?? '',
        prefixStyle: TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
        // hint
        hintText: hint,
        hintStyle: Style.hintStyle(),
        // error
        errorStyle: TextStyle(fontSize: 10),
        // outlineBorder
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),

        contentPadding: contentPadding,
        // filled: false,
        fillColor: HexColor('##fef1f4'),
        //
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide(
            color: Style.primaryColor,
            width: 1,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        //
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide(
            color: Style.customGrey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
