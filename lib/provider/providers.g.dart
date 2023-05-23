// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$googleSignInHash() => r'db69ab57f890572b634d299227d35cf3d717b8f9';

/// See also [googleSignIn].
@ProviderFor(googleSignIn)
final googleSignInProvider = AutoDisposeProvider<GoogleSignIn>.internal(
  googleSignIn,
  name: r'googleSignInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$googleSignInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoogleSignInRef = AutoDisposeProviderRef<GoogleSignIn>;
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
String _$userControllerNotifierHash() =>
    r'06683d13c619e7bfe4c5884ea94a49bfe68985fc';

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
String _$calendarNotifierHash() => r'bf4268c601a44a0351748afef61003da29aae953';

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
