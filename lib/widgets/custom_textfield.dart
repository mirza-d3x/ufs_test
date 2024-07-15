import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.textEditingController,
    this.hintText = "",
    this.maxLines = 1,
    this.title,
  });

  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final String hintText;
  final int maxLines;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 8),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: Color(0xff00004a)),
            ),
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}
