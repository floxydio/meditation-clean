import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:meditationapp/presentasion/auth/screen/signin_auth.screen.dart';
import 'package:meditationapp/presentasion/home/home.main.dart';
import 'package:meditationapp/presentasion/news/news_main.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({Key? key}) : super(key: key);

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  List<BottomNavyBarItem> item = [
    BottomNavyBarItem(icon: const Icon(Icons.home), title: const Text("Home")),
    BottomNavyBarItem(
        icon: const Icon(Icons.newspaper), title: const Text("News")),
    BottomNavyBarItem(
        icon: const Icon(Icons.music_note), title: const Text("Music")),
    BottomNavyBarItem(
        icon: const Icon(Icons.logout), title: const Text("Logout")),
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
            child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: const [
            HomeMain(),
            NewsMain(),
            Center(child: Text("Coming Soon")),
            Center(child: Text("Coming Soon"))
          ],
        )),
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: currentIndex,
            items: item,
            onItemSelected: (index) => setState(() {
                  currentIndex = index;
                  pageController?.animateToPage(index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceIn);
                })));
  }
}
