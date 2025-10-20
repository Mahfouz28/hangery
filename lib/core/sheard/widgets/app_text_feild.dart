import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';

class AppTextFeild extends StatefulWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final String? labelText;
  final bool? enabled;

  final Color? labelColor;
  final Color? hintColor;

  const AppTextFeild({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.keyboardType,
    this.validator,
    this.labelText,
    this.fillColor,
    this.labelColor,
    this.hintColor,
    this.enabled,
  });

  @override
  State<AppTextFeild> createState() => _AppTextFeildState();
}

class _AppTextFeildState extends State<AppTextFeild> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText ?? false;
  }

  void toggleObscureText() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      cursorColor: AppColors.primaryColor,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
      controller: widget.controller,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.keyboardType,
      obscureText: isObscure,
      validator: widget.validator,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,

        fillColor: widget.fillColor ?? Colors.black12,
        filled: true,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.labelColor ?? Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor ?? Colors.white70,
          fontSize: 18.sp,
        ),
        suffixIconColor: AppColors.primaryColor,

        suffixIcon: widget.obscureText == true
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: toggleObscureText,
              )
            : widget.suffixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
