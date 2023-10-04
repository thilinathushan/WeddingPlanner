import 'package:flutter/material.dart';
import 'package:planner/app_style.dart';
import 'budget_page.dart';
import 'guest_page.dart';
import 'home_page.dart';
import 'planning_page.dart';
import 'vendors_page.dart';
import '../widgets/couple_app_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages = const [
    HomePage(),
    PlanningPage(),
    BudgetPage(),
    GuestPage(),
    VendorsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CoupleAppBar(),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            color: kPrimaryBlue,
            fontSize: 15,
          ),
          unselectedLabelStyle: const TextStyle(
            color: kDarkGray,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/home.png',
                    height: 30,
                    color: _selectedIndex == 0 ? kPrimaryBlue : kDarkGray),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/to-do-list.png',
                    height: 30,
                    color: _selectedIndex == 1 ? kPrimaryBlue : kDarkGray),
                label: "Planning"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/budget.png',
                    height: 30,
                    color: _selectedIndex == 2 ? kPrimaryBlue : kDarkGray),
                label: "Budget"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/guests.png',
                    height: 30,
                    color: _selectedIndex == 3 ? kPrimaryBlue : kDarkGray),
                label: "Guests"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/store.png',
                    height: 30,
                    color: _selectedIndex == 4 ? kPrimaryBlue : kDarkGray),
                label: "Vendors"),
          ],
        ),
      ),
    );
  }
}
