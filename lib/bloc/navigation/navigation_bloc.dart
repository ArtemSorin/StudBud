import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

import '../../screens/home.dart';
import '../../screens/chats.dart';
import '../../screens/profile.dart';
import '../../screens/settings.dart';

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
