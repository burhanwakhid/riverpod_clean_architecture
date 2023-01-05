import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/app/app.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: const App(),
    ),
  );
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
    }
  }
}
