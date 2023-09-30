import 'package:flutter/material.dart';
import 'package:planner/pages/budget_page.dart';
import 'package:planner/pages/guest_page.dart';
import 'package:planner/pages/home_page.dart';
import 'package:planner/pages/planning_page.dart';
import 'package:planner/pages/vendors_page.dart';
import 'package:planner/widgets/couple_app_bar.dart';

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

  final List<Widget> _pages = const [
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
        body: Column(
          children: [
            const CoupleAppBar(),
            Expanded(
              child: ListView(
                children: [
                  _pages[_selectedIndex],
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Planning"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "Budget"),
            BottomNavigationBarItem(
                icon: Icon(Icons.family_restroom), label: "Guests"),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Vendors"),
          ],
        ),
      ),
    );
  }
}
