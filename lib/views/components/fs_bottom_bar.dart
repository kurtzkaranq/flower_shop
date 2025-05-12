import 'package:flower_shop/logic/bloc/tabbar/tabbar_bloc.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FsBottomBar extends StatefulWidget {
  const FsBottomBar(
      {super.key,
      this.selectedIndex = 0,
      required this.onClick,
      required this.items});
  final int selectedIndex;
  final Function(int index) onClick;
  final List<TabbarModel> items;

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
          for (int i = 0; i < widget.items.length; i++)
            TabbarButton(
              isSelected: widget.selectedIndex == i,
              onClick: () {
                widget.onClick(i);
              },
              title: widget.items[i].name,
              path: widget.items[i].path,
            ),
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
    required this.path,
  });
  final bool isSelected;
  final Function onClick;
  final String title;
  final String path;
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
            SizedBox(
              height: 24,
              width: 42,
              child: Image.asset(
                path,
                color: isSelected ? Colors.amber : null,
              ),
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
