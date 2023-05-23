import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'provider/routing_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CalendarDemo(),
    ),
  );
}

class CalendarDemo extends ConsumerWidget {
  static const localeJa = Locale('ja', 'JP');
  static const localeEn = Locale("en", "US");

  const CalendarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routingProvider),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        localeEn,
        localeJa,
      ],
    );
  }
}
