import 'package:flower_shop/utils/fs_color.dart';
import 'package:flutter/material.dart';

class FsInput extends StatefulWidget {
  const FsInput(
      {super.key,
      required this.title,
      required this.onChanged,
      this.prefixIcon});
  final String title;
  final Function(String text) onChanged;
  final String? prefixIcon;

  @override
  State<FsInput> createState() => _FsInputState();
}

class _FsInputState extends State<FsInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.title,
        filled: true,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/icons/ic_notif.png",
                  width: 12,
                  height: 12,
                ),
              )
            : null,
        fillColor: FsColor.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
