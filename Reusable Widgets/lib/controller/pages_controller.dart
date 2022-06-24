import 'package:customization/screens/home_screen.dart';
import 'package:flutter/material.dart';

class PagesController extends ChangeNotifier {
  Widget _currentPage = const HomeScreen();

  Widget get currentPage => _currentPage;

  void changePage(Widget page) {
    _currentPage = page;
    void changePage(Widget page) {}
    print('Change to ${page.hashCode}');
    notifyListeners();
  }
}
