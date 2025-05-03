import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/navigation/navigation_bloc.dart';
import 'bloc/navigation/navigation_event.dart';
import 'bloc/navigation/navigation_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => NavigationBloc(),
        child: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void _addStory(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Добавить историю'),
            content: const Text('Здесь будет логика добавления истории.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Закрыть'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Лента',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
            actions: const [
              Icon(Icons.notifications, color: Colors.black),
              SizedBox(width: 16),
              Icon(Icons.message, color: Colors.black),
              SizedBox(width: 16),
            ],
          ),
          body: state.currentScreen,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.black),
                  onPressed:
                      () =>
                          context.read<NavigationBloc>().add(NavigateToHome()),
                ),
                IconButton(
                  icon: const Icon(Icons.chat, color: Colors.black),
                  onPressed:
                      () =>
                          context.read<NavigationBloc>().add(NavigateToChats()),
                ),
                const SizedBox(width: 40),
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.black),
                  onPressed:
                      () => context.read<NavigationBloc>().add(
                        NavigateToProfile(),
                      ),
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.black),
                  onPressed:
                      () => context.read<NavigationBloc>().add(
                        NavigateToSettings(),
                      ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addStory(context),
            backgroundColor: Colors.black,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
