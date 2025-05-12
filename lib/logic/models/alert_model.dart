import 'dart:ui';

import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/material.dart';

enum FsAlertType {
  success,
  failed,
  information,
}

class FsAlert {
  final BuildContext context;
  final FsAlertType type;
  final String body;
  final String title;

  FsAlert({
    required this.context,
    this.type = FsAlertType.failed,
    required this.body,
    required this.title,
  });

  show() {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.0),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                left: 8,
                right: 8,
              ),
              decoration: BoxDecoration(
                color: FsColor.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: FsTextstyle.body.copyWith(
                                  height: 1.0,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ImageIcon(
                            AssetImage(
                              'assets/icons/ic_info_circle.png',
                            ),
                            size: 24,
                            color: Colors.red,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        body,
                        style: FsTextstyle.body.copyWith(
                            height: 1.0,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                        textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}

class AlertModel {
  final String title;
  final String body;
  AlertModel({required this.title, required this.body});
}
