// import 'package:e_letter/Screen/home/home_screen_viewModel.dart';

import 'package:e_letter/Helper/style/style.dart';
import 'package:e_letter/Widgets/bottom_nav_bar.dart';
import 'package:e_letter/enum.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now().hour;
    String greeetingMessage() {
      if (time < 12) {
        return 'Selamat Pagi';
      } else if (time >= 12 && time < 16) {
        return 'Selamat Siang';
      } else if (time >= 16 && time < 18) {
        return 'Selamat Sore';
      } else {
        return 'Selamat Malam';
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 6),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  greeetingMessage() + ' guest',
                  style: Styles.txtTitleBigBold,
                ),
                const CircleAvatar(
                  child: Icon(Icons.person),
                )
              ],
            )
          ],
        ),
      )),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuStates.home),
    );
  }
}
