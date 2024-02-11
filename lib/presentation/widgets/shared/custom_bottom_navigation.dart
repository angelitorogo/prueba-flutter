import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {


    int getCurrentIndex( BuildContext context) {

      final String location = GoRouterState.of(context).matchedLocation;

      switch (location) {
        case '/':
          return 0;
        
        case '/second-view':
          return 1;

        case '/third-view':
          return 2;
          
        default:
          return 0;
      }

    }


    void onItemTap( BuildContext context, int index) {

      switch (index) {
        case 0:
          context.go('/');
        break;

        case 1:
          context.go('/second-view');
        break;

        case 2:
          context.go('/third-view');
        break;

      }

    }

    return BottomNavigationBar(
      backgroundColor: const Color(0xFF110431),
      elevation: 0, // Quita la linea que divide con el bottom navigation bar
      currentIndex: getCurrentIndex(context),
      onTap: (value) => onItemTap(context, value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio' 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thumbs_up_down_outlined),
          label: 'second'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'third'
        ),
      ] 
    );
  }
}