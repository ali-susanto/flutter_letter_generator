import 'package:e_letter/Screen/activity/activity_screen.dart';
import 'package:e_letter/enum.dart';
import 'package:e_letter/screen/mobile/home/all_menu.dart';
import 'package:e_letter/screen/mobile/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../Helper/style/style.dart';
import '../Screen/profile/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.selectedMenu}) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -4),
                blurRadius: 20,
                color: Colors.grey.withOpacity(0.5))
          ],
          borderRadius: BorderRadius.circular(20)),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    const HomeScreenMobile()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero));
                  },
                  icon: Icon(
                    Icons.home_outlined,
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    const ActivityScreen()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero)
                        // MaterialPageRoute(
                        //     builder: (_) => const PatientDataScreen()),
                        );
                  },
                  icon: Icon(
                    Icons.history_rounded,
                    color: MenuState.history == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    const AllMenu()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero));
                  },
                  icon: Icon(
                    Icons.dashboard_customize_rounded,
                    color: MenuState.allMenu == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    const ProfileScreen()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero));
                  },
                  icon: Icon(
                    Icons.person,
                    color: MenuState.profile == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
            ],
          )),
    );
  }
}
