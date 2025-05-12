import 'package:flutter/material.dart';

class FsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const FsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 72),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(
                  "assets/icons/ic_back.png",
                  height: 24,
                  width: 24,
                ),
              ),
            ),
            Image.asset(
              "assets/icons/logo.png",
              height: 48,
            ),
            const SizedBox(
              width: 8,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}
