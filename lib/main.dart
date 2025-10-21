import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moody_app/core/theme/app_theme.dart';
import 'package:moody_app/features/auth/login_screen.dart';
import 'package:moody_app/features/auth/register_screen.dart';
import 'package:moody_app/features/home/home_screen.dart';

void main() {
  runApp(const MoodyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/login', 
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

class MoodyApp extends StatelessWidget {
  const MoodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Moody',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme, 
      themeMode: ThemeMode.system, 
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    
    );
  }
}
