

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_1/config/router/app_router_notifier.dart';
import 'package:prueba_1/presentation/app/screens/home_Screen.dart';
import 'package:prueba_1/presentation/app/views/home_view.dart';
import 'package:prueba_1/presentation/app/views/perfil_view.dart';
import 'package:prueba_1/presentation/app/views/second_view.dart';
import 'package:prueba_1/presentation/app/views/third_view.dart';
import 'package:prueba_1/presentation/auth/screens/check_auth_status_screen.dart';
import 'package:prueba_1/presentation/auth/screens/login_screen.dart';
import 'package:prueba_1/presentation/auth/screens/register_screen.dart';
import 'package:prueba_1/presentation/providers/auth_provider.dart';



final goRouterProvider = Provider((ref) {

  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      // State-Preserving
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const CheckAuthStatusScreen();
        },
      ),
      
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      GoRoute(
        path: '/register',
        builder: (context, state) {
          return const ResgisterScreen();
        },
      ),


      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {

          String titulo = '';

          switch (state.fullPath) {
            case '/':
              titulo = 'Inicio';
            break;

            case '/second-view':
              titulo = 'Second';
            break;

            case '/third-view':
              titulo = 'Third';
            break;

            case '/perfil-view':
              titulo = 'Perfil';
            break;
            
          }

          return HomeScreen(childView: navigationShell, titulo: titulo);
        },
            
        branches: [

          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (context, state) {
                return const HomeView();
              },
              
            )
          ]),

          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              path: '/second-view',
              builder: (context, state) {
                return const SecondView();
              },
            )
          ]),

          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              path: '/third-view',
              builder: (context, state) {
                return const ThirdView();
              },
            )
          ]),

          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              path: '/perfil-view',
              builder: (context, state) {
                return const PerfilView();
              },
            )
          ]),
          
        ]),

    ],

    
    // Redireccionar dependiendo de la autenticacion
    redirect:(context, state) {
      
      print(state);
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      print(authStatus);

      if( isGoingTo == '/splash' && authStatus == AuthStatus.checking ) return null;

      if ( authStatus == AuthStatus.notAuthenticated ) {
        if( isGoingTo == '/login' || isGoingTo == '/register' /*|| isGoingTo == '/splash'*/) return null;
        return '/login';
      }

      if ( authStatus == AuthStatus.authenticated ) {
        if( isGoingTo == '/login' || isGoingTo == '/register' || isGoingTo == '/splash') return '/'; 
      }
      
      return null;
      
    },

  );

  


});
