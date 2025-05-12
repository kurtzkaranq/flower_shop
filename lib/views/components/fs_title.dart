import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/cupertino.dart';

class FsTitle extends StatelessWidget {
  const FsTitle(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onClick});
  final String title;
  final String subtitle;
  final Function() onClick;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: FsTextstyle.header,
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onClick,
          child: Text(
            subtitle,
            style: FsTextstyle.header.copyWith(
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
