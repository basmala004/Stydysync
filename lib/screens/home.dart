import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:stydysync/screens/home_screen.dart';
import 'package:stydysync/screens/subjects_screen.dart';
import 'package:stydysync/screens/tasks_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController(initialPage: 1);
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 1,
  );
  final List<Widget> bottomBarPages = [
    SubjectsScreen(),
    HomeScreen(),
    TasksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Prevents manual swiping
        children: bottomBarPages,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        notchColor: Colors.white,
        elevation: 1,
        showLabel: false,
        bottomBarWidth: 500,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.my_library_books_sharp,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.my_library_books_sharp,
              color: Color(0xFF547792),
            ),
            itemLabel: 'Subjects',
          ),

          BottomBarItem(
            inActiveItem: Icon(Icons.home_outlined, color: Colors.grey),
            activeItem: Icon(Icons.home_outlined, color: Color(0xFF547792)),
            itemLabel: 'Home',
          ),

          BottomBarItem(
            inActiveItem: Icon(Icons.checklist, color: Colors.grey),
            activeItem: Icon(Icons.checklist, color: Color(0xFF547792)),
            itemLabel: 'Tasks',
          ),


        ],
        onTap: (value) {
          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        kIconSize: 24,
        kBottomRadius: 28,
      ),
    );

  }
}
