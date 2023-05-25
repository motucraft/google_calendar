// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isAuthorizedHash() => r'0d4229243523cb7895b6a7d1a611d2c8b62ea1af';

/// See also [IsAuthorized].
@ProviderFor(IsAuthorized)
final isAuthorizedProvider =
    AutoDisposeNotifierProvider<IsAuthorized, bool>.internal(
  IsAuthorized.new,
  name: r'isAuthorizedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isAuthorizedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsAuthorized = AutoDisposeNotifier<bool>;
String _$isSigneInHash() => r'6958966aa37c281fa469cbdb44d6eee1a7b16da5';

/// See also [IsSigneIn].
@ProviderFor(IsSigneIn)
final isSigneInProvider =
    AutoDisposeAsyncNotifierProvider<IsSigneIn, bool>.internal(
  IsSigneIn.new,
  name: r'isSigneInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isSigneInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsSigneIn = AutoDisposeAsyncNotifier<bool>;
String _$googleSignInNotifierHash() =>
    r'5a7c355bb7dc86dcaab705d4742546fd583f8ce6';

/// See also [GoogleSignInNotifier].
@ProviderFor(GoogleSignInNotifier)
final googleSignInNotifierProvider =
    AutoDisposeNotifierProvider<GoogleSignInNotifier, GoogleSignIn>.internal(
  GoogleSignInNotifier.new,
  name: r'googleSignInNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$googleSignInNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GoogleSignInNotifier = AutoDisposeNotifier<GoogleSignIn>;
String _$userControllerNotifierHash() =>
    r'70afb87527bc723287f37f81afc3dd210ecf9391';

/// See also [UserControllerNotifier].
@ProviderFor(UserControllerNotifier)
final userControllerNotifierProvider = AutoDisposeAsyncNotifierProvider<
    UserControllerNotifier, GoogleSignInAccount?>.internal(
  UserControllerNotifier.new,
  name: r'userControllerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userControllerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserControllerNotifier
    = AutoDisposeAsyncNotifier<GoogleSignInAccount?>;
String _$authClientNotifierHash() =>
    r'd98a77fb6b9021cc249e307df267ca5f4f27a675';

/// See also [AuthClientNotifier].
@ProviderFor(AuthClientNotifier)
final authClientNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AuthClientNotifier, CalendarApi>.internal(
  AuthClientNotifier.new,
  name: r'authClientNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authClientNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthClientNotifier = AutoDisposeAsyncNotifier<CalendarApi>;
String _$calendarNotifierHash() => r'906f3103db4599d37f8b16f63b0f9b234be70ad7';

/// See also [CalendarNotifier].
@ProviderFor(CalendarNotifier)
final calendarNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CalendarNotifier, Events?>.internal(
  CalendarNotifier.new,
  name: r'calendarNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CalendarNotifier = AutoDisposeAsyncNotifier<Events?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
