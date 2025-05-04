import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

import '../../screens/chats_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/profile_screen.dart';
import '../../screens/settings_screen.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(initialNavigationState) {
    on<NavigateToHome>((event, emit) {
      emit(NavigationState(0, const HomeScreen()));
    });

    on<NavigateToChats>((event, emit) {
      emit(NavigationState(1, const ChatsScreen()));
    });

    on<NavigateToProfile>((event, emit) {
      emit(NavigationState(2, const ProfileScreen()));
    });

    on<NavigateToSettings>((event, emit) {
      emit(NavigationState(3, const SettingsScreen()));
    });
  }
}
