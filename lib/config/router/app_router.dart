import 'package:go_router/go_router.dart';
import 'package:notifications_app/presentation/screens/details_screen.dart';
import 'package:notifications_app/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/push-details/:messageId',
      builder: (context, state) =>
          DetailScreen(pushMessageId: state.pathParameters['messageId'] ?? ''),
    ),
  ],
);
