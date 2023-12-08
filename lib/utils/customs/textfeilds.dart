import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../app_config.dart';
import '../app_theme/AppColors.dart';

// ignore: must_be_immutable
class AppTextFormFiled extends StatefulWidget {
  final String hintText;
  final double width;
  final double height;
  final bool isPassword;
  final bool isNumber;
  final double textSize;
  final bool isPrefixIcon;
  final int lines;
  final Function(String)? validation;
  final TextEditingController? cntr;
  final TextInputType? keyboardtype;
  final bool readOnly;
  final IconData prefixIcon;
  final GestureTapCallback? onTextFieldClick;
  final FontWeight? fontweight;
  final Color? cursorColor;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  Function? onChange;
  TextEditingController? controller;
  AppTextFormFiled(
      {Key? key,
      this.width = double.infinity,
      this.prefixIcon = Icons.mail_outline_sharp,
      this.isPrefixIcon = false,
      this.cursorColor = Colors.black,
      this.textColor = Colors.black,
      this.isPassword = false,
      this.isNumber = false,
      this.onChange,
      this.hintText = "example@gmail.com",
      this.textSize = 14,
      this.height = 75,
      this.validation,
      this.onTextFieldClick,
      this.keyboardtype,
      this.readOnly = false,
      this.lines = 1,
      this.fontweight = FontWeight.w400,
      this.textAlign = TextAlign.start,
      this.textAlignVertical = TextAlignVertical.center,
      this.cntr})
      : super(key: key);

  @override
  State<AppTextFormFiled> createState() => _AppTextFormFiledState();
}

class _AppTextFormFiledState extends State<AppTextFormFiled> {
  // FocusNode _focusNode = FocusNode();
  // Color _color = AppColors.primaryLight;
  bool isObscure = false;
  // @override
  // void initState() {
  //   super.initState();
  //   print(widget.isPassword == true);
  //   setState(() {
  //     isObscure = widget.isPassword == true;
  //   });
  //   _focusNode.addListener(() {
  //     if (_focusNode.hasFocus) {
  //       setState(() {
  //         _color = Colors.blue.withOpacity(0.1);
  //       });
  //     } else {
  //       setState(() {
  //         _color = AppColors.primaryLight;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: widget.height,
      width: widget.width,
      child: TextFormField(
        // focusNode: _focusNode,

        maxLines: widget.lines,
        // minLines: widget.lines,
        onTap: widget.onTextFieldClick,
        readOnly: widget.readOnly,
        validator: widget.validation as String? Function(String?)?,
        // obscureText: isObscure,
        cursorColor: widget.cursorColor,
        textAlignVertical: widget.textAlignVertical,
        textAlign: widget.textAlign!,

        onChanged: (value) {
          try {
            widget.onChange!(value);
          } catch (e) {}
        },
        style: TextStyle(
          color: widget.textColor,
          fontWeight: widget.fontweight,
          fontSize: widget.textSize,
        ),
        controller: widget.cntr,
        obscureText: widget.isPassword ? !isObscure : false,
        keyboardType: widget.keyboardtype,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          contentPadding:
              EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 5),
          // fillColor: AppColors.grey.withOpacity(0.05),
          fillColor: AppColors.background,

          filled: true,

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.black, width: 5)),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.black,
              )),

          prefixIcon: widget.isPrefixIcon
              ? Icon(
                  widget.prefixIcon,
                  size: 20,
                  color: AppColors.white,
                )
              : null,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                    size: 20,
                  ))
              : null,
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(67),
          //   borderSide: BorderSide(
          //     color: Colors.white,
          //     width: 1.0,
          //   ),
          // ),
          focusColor: AppColors.black,
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(67),
          //     borderSide: const BorderSide(
          //       width: 1.0,
          //       color: Colors.transparent,
          //     )),

          hintText: widget.hintText,
          // label: _focusNode.hasFocus ? AppText.text(widget.hintText) : null,
          hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: widget.textSize,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class AppTextFeild {
  searchFeild({
    required BuildContext context,
    required String hintText,
    String? errorMessage,
    FocusNode? focusNode,
    Function? onChange,
    Function? onSearch,
    GestureTapCallback? onFilterClick,
    initialValue,
    // TextEditingController? textfeildController,
  }) {
    return Material(
      elevation: 0.4,
      // shadowColor: AppColor.dark.withOpacity(0.5),
      borderRadius: BorderRadius.circular(13),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        initialValue: initialValue,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(13.0),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.background),
            borderRadius: BorderRadius.all(
              Radius.circular(13.0),
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.primaryDark.withOpacity(0.4),
            fontSize: AppConfig(context).width / 29,
            fontWeight: FontWeight.w500,
          ),
          alignLabelWithHint: true,
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
          prefixIcon: Container(
            width: AppConfig(context).width / 10,
            height: 30,
            color: AppColors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 0,
              ),
              child: Icon(
                Icons.search_sharp,
                size: 25,
                color: AppColors.primaryDark.withOpacity(0.5),
              ),
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: onFilterClick,
            child: Container(
              width: AppConfig(context).width / 10,
              height: 30,
              color: AppColors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 0,
                ),
                child: Icon(
                  Icons.tune_sharp,
                  size: 25,
                  color: AppColors.primaryDark.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        style: TextStyle(
          color: AppColors.primaryDark,
          fontSize: AppConfig(context).width / 27,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: AppColors.primaryDark,
        focusNode: focusNode,
        onChanged: (value) {
          // print(value);
          onChange!(value);
        },
        onEditingComplete: () {
          onSearch!();
        },
      ),
    );
  }
}
