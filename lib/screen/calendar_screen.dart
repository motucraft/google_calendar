import 'package:flutter/material.dart';
import 'package:google_calendar/provider/providers.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../util/logger.dart';
import 'datasource/calendar_data_source.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarNotifier = ref.watch(calendarNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Calendar with syncfusion_flutter_calendar'),
      ),
      body: calendarNotifier.when(
        data: (events) {
          final items = _createDataSource(events?.items);

          return SfCalendar(
            allowDragAndDrop: true,
            view: CalendarView.month,
            dataSource: EventDataSource(items),
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            ),
            onDragStart:
                (AppointmentDragStartDetails appointmentDragStartDetails) {
              // イベントがタップされた場合、ドラッグを開始
              final appointment = appointmentDragStartDetails.appointment;
              CalendarResource? resource = appointmentDragStartDetails.resource;
              logger.info('onDragStart appointment=$appointment');
              logger.info('onDragStart resource=$resource');
            },
            // onDragUpdate:
            //     (AppointmentDragUpdateDetails appointmentDragUpdateDetails) {
            //   final appointment = appointmentDragUpdateDetails.appointment;
            //   logger.info('onDragUpdate appointment=$appointment');
            // },
            // onDragEnd: (AppointmentDragEndDetails appointmentDragEndDetails) {
            //   final appointment = appointmentDragEndDetails.appointment;
            //   logger.info('onDragEnd appointment=$appointment');
            // },
          );
        },
        error: (error, stack) {
          logger.severe(error);
          logger.severe(stack);
          return const SizedBox();
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  List<CalendarEvent> _createDataSource(List<calendar.Event>? items) {
    if (items == null || items.isEmpty) {
      return [];
    }

    return items
        .map(
          (event) => CalendarEvent(
            eventName: event.summary ?? '',
            from: event.start?.date ?? DateTime.now(),
            to: event.end?.date ?? DateTime.now(),
            background: Colors.green,
            isAllDay: false,
          ),
        )
        .toList();
  }
}
