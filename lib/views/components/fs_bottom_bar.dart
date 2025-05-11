import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FsBottomBar extends StatefulWidget {
  const FsBottomBar({super.key, this.selectedIndex = 0, required this.onClick});
  final int selectedIndex;
  final Function(int index) onClick;

  @override
  State<FsBottomBar> createState() => _FsBottomBarState();
}

class _FsBottomBarState extends State<FsBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: FsColor.darkGreen,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TabbarButton(
            isSelected: widget.selectedIndex == 0,
            onClick: () {
              widget.onClick(0);
            },
            title: "Home",
          ),
          TabbarButton(
              isSelected: widget.selectedIndex == 1,
              title: "Shop",
              onClick: () {
                widget.onClick(1);
              }),
          TabbarButton(
              title: "Favorites",
              isSelected: widget.selectedIndex == 2,
              onClick: () {
                widget.onClick(2);
              }),
          TabbarButton(
              title: "Cart",
              isSelected: widget.selectedIndex == 3,
              onClick: () {
                widget.onClick(3);
              }),
          TabbarButton(
              title: "Account",
              isSelected: widget.selectedIndex == 4,
              onClick: () {
                widget.onClick(4);
              }),
        ],
      ),
    );
  }
}

class TabbarButton extends StatelessWidget {
  const TabbarButton({
    super.key,
    required this.isSelected,
    required this.onClick,
    required this.title,
  });
  final bool isSelected;
  final Function onClick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        onClick();
      },
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            const SizedBox(
              height: 24,
              width: 42,
              child: Placeholder(),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: FsTextstyle.body.copyWith(
                color: isSelected ? Colors.amber : null,
                fontSize: 12,
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 32,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      12,
                    )),
              )
          ],
        ),
      ),
    );
  }
}
