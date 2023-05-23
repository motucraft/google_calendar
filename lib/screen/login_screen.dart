import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/providers.dart';
import '../util/logger.dart';
import 'parts/sign_in_button.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userControllerAsyncValue = ref.watch(userControllerNotifierProvider);
    final isAuthorized = ref.watch(isAuthorizedProvider);
    logger.info('isAuthorized=$isAuthorized');

    useEffect(() {
      ref.read(googleSignInProvider).signInSilently();
      return null;
    }, []);

    return Scaffold(
      body: userControllerAsyncValue.when(
        data: (user) {
          logger.info('user=$user');

          Widget content = const SizedBox();
          if (user != null) {
            content = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleUserCircleAvatar(
                      identity: user,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.displayName ?? ''),
                        Text(user.email),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                if (isAuthorized) ...[
                  ElevatedButton(
                    onPressed: () async => await ref
                        .read(userControllerNotifierProvider.notifier)
                        .handleGetContact(),
                    child: const Text('REFRESH'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final authenticatedClient = await ref
                            .read(googleSignInProvider)
                            .authenticatedClient();
                        final calendarApi =
                            calendar.CalendarApi(authenticatedClient!);

                        final events = await calendarApi.events.list('primary');
                        events.items?.forEach((element) {
                          logger.info(element.id);
                          logger.info(element.summary);
                        });

                        if (context.mounted) {
                          context.goNamed('calendar');
                        }
                      } on Exception catch (e) {
                        logger.severe(e);
                      }
                    },
                    child: const Text('カレンダー'),
                  ),
                ],
                if (!isAuthorized) ...[
                  const Text('パーミッションをリクエストします'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final isAuthorized = await ref
                          .read(googleSignInProvider)
                          .requestScopes(scopes);
                      ref
                          .read(isAuthorizedProvider.notifier)
                          .update(isAuthorized);

                      if (isAuthorized) {
                        await ref
                            .read(userControllerNotifierProvider.notifier)
                            .handleGetContact();
                      }
                    },
                    child: const Text('Request Permissions'),
                  ),
                ],
                const SizedBox(height: 24),
                const Text('ログイン成功しました'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async =>
                      await ref.read(googleSignInProvider).disconnect(),
                  child: const Text('Sign out'),
                ),
              ],
            );
          } else {
            content = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('現在ログインしていません'),
                const SizedBox(height: 8),
                buildSignInButton(
                  onPressed: () async =>
                      await ref.read(googleSignInProvider).signIn(),
                ),
              ],
            );
          }

          return Scaffold(
            body: Center(
              child: content,
            ),
          );
        },
        error: (error, stack) {
          logger.severe(error);
          logger.severe(stack);
          return const CircularProgressIndicator();
        },
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
