import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_calendar/provider/providers.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../util/logger.dart';
import 'add_event_dialog_content.dart';
import 'datasource/calendar_data_source.dart';

const calendarColor = <String, Color>{
  '1': Color(0xFF7986CB),
  '2': Color(0xFF33B679),
  '3': Color(0xFF8E24AA),
  '4': Color(0xFFE67C73),
  '5': Color(0xFFF6BF26),
  '6': Color(0xFFF4511E),
  '7': Color(0xFF039BE5),
  '8': Color(0xFF616161),
  '9': Color(0xFF3F51B5),
  '10': Color(0xFF0B8043),
  '11': Color(0xFFD50000),
};

class CalendarScreen extends HookConsumerWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final calendarNotifier = ref.watch(calendarNotifierProvider);

    final onDragStartEvent = useState<CalendarEvent?>(null);

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
            allowedViews: const [
              CalendarView.day,
              CalendarView.week,
              CalendarView.workWeek,
              CalendarView.timelineDay,
              CalendarView.timelineWeek,
              CalendarView.timelineWorkWeek,
              CalendarView.month,
              CalendarView.schedule
            ],
            dataSource: EventDataSource(items),
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            ),

            onDragStart:
                (AppointmentDragStartDetails appointmentDragStartDetails) =>
                    onDragStartEvent.value = appointmentDragStartDetails
                        .appointment as CalendarEvent,

            // update calendar event
            onDragEnd:
                (AppointmentDragEndDetails appointmentDragEndDetails) async {
              final droppingTime = appointmentDragEndDetails.droppingTime;

              final dragStartEvent = onDragStartEvent.value!;

              final calendarApi =
                  await ref.read(authClientNotifierProvider.future);

              final eventRequest = calendar.Event();
              eventRequest.start = calendar.EventDateTime()
                ..dateTime = dragStartEvent.from
                    .copyWith(
                        year: droppingTime?.year,
                        month: droppingTime?.month,
                        day: droppingTime?.day)
                    .toUtc();
              eventRequest.end = calendar.EventDateTime()
                ..dateTime = dragStartEvent.to
                    .copyWith(
                        year: droppingTime?.year,
                        month: droppingTime?.month,
                        day: droppingTime?.day)
                    .toUtc();

              await calendarApi.events
                  .patch(eventRequest, 'primary', dragStartEvent.id);

              onDragStartEvent.value = null;
              ref.invalidate(calendarNotifierProvider);
            },
            onTap: (CalendarTapDetails calendarTapDetails) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add Event'),
                    content: AddEventDialogContent(controller: titleController),
                    actions: [
                      ElevatedButton(
                        onPressed: () => context.pop(),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (titleController.text.isEmpty ||
                              calendarTapDetails.date == null) {
                            return;
                          }

                          final title = titleController.text;
                          final selectedDate = calendarTapDetails.date!;
                          final selectedTime = ref.read(datePickerProvider);

                          final start = selectedDate.copyWith(
                              hour: selectedTime.hour,
                              minute: selectedTime.minute);

                          final calendarApi =
                              await ref.read(authClientNotifierProvider.future);
                          final eventRequest = calendar.Event()
                            ..summary = title;

                          eventRequest.start = calendar.EventDateTime()
                            ..dateTime = start.toUtc();
                          eventRequest.end = calendar.EventDateTime()
                            ..dateTime =
                                start.add(const Duration(hours: 1)).toUtc();

                          await calendarApi.events.insert(
                            eventRequest,
                            'primary',
                          );

                          ref.invalidate(calendarNotifierProvider);
                          titleController.clear();
                          if (context.mounted) {
                            context.pop();
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
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

    return items.map(
      (event) {
        // 終日イベント
        if (event.start!.date != null && event.end!.date != null) {
          return CalendarEvent(
            id: event.id!,
            eventName: event.summary!,
            from: event.start!.date!,
            to: event.end!.date!.subtract(const Duration(seconds: 1)),
            background: calendarColor[event.colorId] ?? Colors.blueAccent,
            isAllDay: true,
          );
        }

        return CalendarEvent(
          id: event.id!,
          eventName: event.summary!,
          from: event.start!.dateTime!.toLocal(),
          to: event.end!.dateTime!.toLocal(),
          background: calendarColor[event.colorId] ?? Colors.blueAccent,
          isAllDay: false,
        );
      },
    ).toList();
  }
}
