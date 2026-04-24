import 'package:flutter/material.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/text_style.dart';

class AppForm extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final bool isError, isPassword;
  final String? hintText;
  final FocusNode? focusNode;

  const AppForm({
    super.key,
    required this.title,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isError = false,
    this.isPassword = false,
    this.hintText,
    this.focusNode,
  });

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  late FocusNode _focusNode;
  late ValueNotifier<bool> _isHide;

  @override
  void initState() {
    super.initState();
    _isHide = ValueNotifier(true);
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _isHide.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6.0,
      children: [
        Text(widget.title, style: bodyRegular),
        ValueListenableBuilder(
          valueListenable: _isHide,
          builder: (_, isHide, _) {
            return TextFormField(
              focusNode: _focusNode,
              style: bodyRegular,
              controller: widget.controller,
              obscureText: widget.isPassword ? isHide : false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                suffixIcon: () {
                  if (widget.isPassword) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => _isHide.value = !_isHide.value,
                      child: Icon(isHide ? Icons.visibility_off : Icons.visibility, color: AppColors.gray400),
                    );
                  }
                  return widget.suffixIcon;
                } (),
                hintStyle: bodyRegular.copyWith(color: AppColors.gray400),
                enabledBorder: _border(borderColor: AppColors.gray400),
                focusedBorder: _border(borderColor: AppColors.black),
                errorBorder: _border(borderColor: AppColors.red500),
                focusedErrorBorder: _border(borderColor: AppColors.black)
              ),
            );
          }
        ),
            
      ],
    );
  }

  InputBorder _border({required final Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: borderColor,
      )
    );
  }
}