import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications_app/config/router/app_router.dart';
import 'package:notifications_app/config/theme/app_theme.dart';
import 'package:notifications_app/presentation/blocs/bloc/notifications_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => NotificationsBloc()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
