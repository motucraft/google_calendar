import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_event_dialog_content.g.dart';

@riverpod
class DatePicker extends _$DatePicker {
  @override
  DateTime build() {
    return DateTime.now();
  }

  DateTime update(DateTime Function(DateTime state) cb) => state = cb(state);
}

class AddEventDialogContent extends ConsumerWidget {
  final TextEditingController controller;

  const AddEventDialogContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Title',
          ),
        ),
        Flexible(
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 200,
              ),
              child: SizedBox(
                width: 200,
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: ref.watch(datePickerProvider),
                  onDateTimeChanged: (newDate) => ref
                      .read(datePickerProvider.notifier)
                      .update((_) => newDate),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
