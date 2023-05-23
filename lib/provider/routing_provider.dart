import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../screen/calendar_screen.dart';
import '../screen/login_screen.dart';

part 'routing_provider.g.dart';

@riverpod
// ignore: unsupported_provider_value
GoRouter routing(RoutingRef ref) {
  final router = GoRouter(
    // routerNeglect: true,
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: '/',
        pageBuilder: (_, __) {
          return const MaterialPage(child: LoginScreen());
        },
        routes: [
          GoRoute(
            path: 'calendar',
            name: 'calendar',
            pageBuilder: (_, __) {
              return const MaterialPage(child: CalendarScreen());
            },
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}
