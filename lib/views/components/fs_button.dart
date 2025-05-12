import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/cupertino.dart';

enum FsButtonType {
  secondary,
  main;

  Color get backgroundColor {
    switch (this) {
      case secondary:
        return FsColor.grey;
      default:
        return FsColor.mainGreen;
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case secondary:
        return FsTextstyle.secondary;
      default:
        return FsTextstyle.body;
    }
  }

  Color? get buttonOutline {
    if (this == secondary) {
      return FsColor.mainGreen;
    }
    return null;
  }
}

class FsButton extends StatelessWidget {
  const FsButton(
      {super.key,
      required this.title,
      required this.onClick,
      this.type = FsButtonType.main});
  final String title;
  final Function() onClick;
  final FsButtonType type;
  static FsButton mainButton(
      {required String title, required Function() onClick}) {
    return FsButton(
      title: title,
      onClick: onClick,
    );
  }

  static FsButton secondaryButton({
    required String title,
    required Function() onClick,
  }) {
    return FsButton(
      title: title,
      onClick: onClick,
      type: FsButtonType.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: type.buttonOutline ?? type.backgroundColor,
        ),
        borderRadius: BorderRadius.circular(
          24,
        ),
      ),
      width: double.infinity,
      child: CupertinoButton(
        color: type.backgroundColor,
        onPressed: onClick,
        borderRadius: BorderRadius.circular(
          24,
        ),
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: type.backgroundColor,
        // ),
        child: Text(
          title,
          style: type.textStyle,
        ),
      ),
    );
  }
}
