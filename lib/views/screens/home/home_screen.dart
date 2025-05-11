import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/views/components/fs_bottom_notch.dart';
import 'package:flower_shop/views/components/fs_input.dart';
import 'package:flower_shop/views/components/fs_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  Image.asset(
                    "assets/icons/logo.png",
                    height: 48,
                  ),
                  Image.asset(
                    "assets/icons/ic_notif.png",
                    height: 24,
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              FsInput(
                title: "title",
                onChanged: print,
              ),
              const SizedBox(
                height: 16,
              ),
              FsTitle(
                onClick: () {
                  print("aa");
                },
                subtitle: "View all",
                title: "Special offers",
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  "assets/images/img_sales.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 12; i++)
                      // Rounded items
                      Container(
                        width: 40,
                        margin: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            SizedBox(height: 40, child: Placeholder()),
                            const SizedBox(
                              height: 4,
                            ),
                            Text("name")
                          ],
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              FsTitle(
                onClick: () {
                  print("aa");
                },
                subtitle: "View all",
                title: "Trends & Popular now",
              ),
              const SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 12; i++)
                      // Rounded items
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          border: Border.all(
                            width: 1,
                            color: FsColor.lighterGreen,
                          ),
                        ),
                        width: 136,
                        height: 150,
                        margin: const EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 90,
                              child: Placeholder(),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "name",
                              style: FsTextstyle.header.copyWith(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "price",
                              style: FsTextstyle.header.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              FsTitle(
                onClick: () {
                  print("aa");
                },
                subtitle: "View all",
                title: "Halloween theme",
              ),
              const SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 12; i++)
                      // Rounded items
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          border: Border.all(
                            width: 1,
                            color: FsColor.lighterGreen,
                          ),
                        ),
                        width: 136,
                        height: 150,
                        margin: const EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 90,
                              child: Placeholder(),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "name",
                              style: FsTextstyle.header.copyWith(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "price",
                              style: FsTextstyle.header.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Upcoming events",
                  style: FsTextstyle.header,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  "assets/images/img_christmas.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const FsBottomNotch(),
              // Text(
              //   "aa",
              // )
            ],
          ),
        ),
      ),
    );
  }
}
