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
    r'69ba8659fd6c534b3eac23eed220fe130d073c13';

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
    r'2791351416a5acb972f492c5f04e9c6bf03e5c05';

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
    r'd839af9ae14c35c6f357d571d08dae720c80deba';

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
String _$calendarNotifierHash() => r'5a3a34400e0cb32b8b6819d7f39df7397fb4e3de';

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
