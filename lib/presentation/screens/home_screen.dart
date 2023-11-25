import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications_app/domain/entities/push_message.dart';
import 'package:notifications_app/presentation/blocs/bloc/notifications_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const name = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context
            .select((NotificationsBloc bloc) => Text('${bloc.state.status}')),
        actions: [
          IconButton(
              onPressed: () {
                context.read<NotificationsBloc>().requestPermissions();
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final notifications =
        context.watch<NotificationsBloc>().state.notifications;
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          title: Text(notification.title),
          subtitle: Text(notification.body),
          leading: notification.imageUrl != null
              ? _notificationImage(notification)
              : const SizedBox(),
        );
      },
    );
  }

  Widget _notificationImage(PushMessage notification) {
    return FadeIn(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          notification.imageUrl!,
          fit: BoxFit.cover,
          width: 80,
        ),
      ),
    );
  }
}
