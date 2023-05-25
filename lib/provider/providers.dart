import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../util/logger.dart';

part 'providers.g.dart';

/// The scopes required by this application.
const List<String> scopes = [
  // 'email',
  'https://www.googleapis.com/auth/contacts.readonly',
  CalendarApi.calendarScope,
];

@riverpod
class IsAuthorized extends _$IsAuthorized {
  @override
  bool build() => false;

  void update(bool value) => state = value;
}

@riverpod
class IsSigneIn extends _$IsSigneIn {
  @override
  Future<bool> build() async {
    return await ref.watch(googleSignInNotifierProvider).isSignedIn();
  }
}

@riverpod
class GoogleSignInNotifier extends _$GoogleSignInNotifier {
  @override
  GoogleSignIn build() {
    return GoogleSignIn(
      // Optional clientId
      clientId:
          '997098979845-jn2r8s8713khgmkhsnt7os68hq0u4bvp.apps.googleusercontent.com',
      scopes: scopes,
    );
  }

  Future<void> signInSilently() async {
    await state.signInSilently();
    final isAuth = await state.requestScopes(scopes);
    ref.read(isAuthorizedProvider.notifier).update(isAuth);
  }
}

@riverpod
class UserControllerNotifier extends _$UserControllerNotifier {
  @override
  Future<GoogleSignInAccount?> build() async {
    state = const AsyncLoading();

    final googleSignIn = ref.watch(googleSignInNotifierProvider);
    logger.info('currentUser=${googleSignIn.currentUser}');
    googleSignIn.onCurrentUserChanged.listen((account) async {
      final isAuth = await isAuthorized();

      logger.info('isAuth=$isAuth');
      state = AsyncData(account);
    });

    return null;
  }

  Future<bool> isAuthorized() async {
    final googleSignIn = ref.read(googleSignInNotifierProvider);
    final account = googleSignIn.currentUser;
    // In mobile, being authenticated means being authorized...
    bool isAuthorized = account != null;

    // However, in the web...
    if (kIsWeb && account != null) {
      isAuthorized = await googleSignIn.canAccessScopes(scopes);
    }

    ref.read(isAuthorizedProvider.notifier).update(isAuthorized);

    return isAuthorized;
  }
}

@riverpod
class AuthClientNotifier extends _$AuthClientNotifier {
  @override
  Future<CalendarApi> build() async {
    state = const AsyncLoading();
    await ref.watch(userControllerNotifierProvider.future);

    final authenticatedClient =
        await ref.watch(googleSignInNotifierProvider).authenticatedClient();
    return calendar.CalendarApi(authenticatedClient!);
  }
}

@riverpod
class CalendarNotifier extends _$CalendarNotifier {
  @override
  Future<Events?> build() async {
    state = const AsyncLoading();

    if (!ref.watch(isAuthorizedProvider)) {
      return null;
    }
    final calendarApi = await ref.watch(authClientNotifierProvider.future);

    return await calendarApi.events.list('primary');
  }
}
