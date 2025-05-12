import 'package:flower_shop/utils/fs_color.dart';
import 'package:flutter/material.dart';

class FsLoading extends StatelessWidget {
  const FsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Center(
          child: Container(
            height: 16,
            width: 16,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(FsColor.mainGreen),
            ),
          ),
        ),
      ),
    );
  }
}
