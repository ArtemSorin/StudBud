import 'package:flutter/material.dart';

import '../../screens/home_screen.dart';

class NavigationState {
  final int currentIndex;
  final Widget currentScreen;

  NavigationState(this.currentIndex, this.currentScreen);
}

final NavigationState initialNavigationState = NavigationState(
  0,
  const HomeScreen(),
);
