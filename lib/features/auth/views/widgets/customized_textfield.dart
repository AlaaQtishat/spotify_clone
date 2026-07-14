import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizedTextfield extends StatefulWidget {
  final String hint;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  const CustomizedTextfield({
    super.key,
    required this.hint,
    required this.validator,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomizedTextfield> createState() => _CustomizedTextfieldState();
}

class _CustomizedTextfieldState extends State<CustomizedTextfield> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.validator,
        cursorColor: Colors.grey.shade600,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 12.w),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.white,

          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.10),
              width: 0.5,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.10),
              width: 0.5,
            ),
          ),

          // border just in case
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.10),
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
