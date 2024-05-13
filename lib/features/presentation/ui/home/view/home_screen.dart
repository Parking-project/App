import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  // final TextEditingController _title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ProfileRoute(),
        ReserveListRoute(),
        ReserveHistoryRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Профиль"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.data_usage),
                label: "Бронирования"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.data_usage),
                label: "История бронирований"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Настройки"
              ),
            ],
          ),
        );
      },
    );
  }
}
