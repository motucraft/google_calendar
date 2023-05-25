import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<CalendarEvent> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  Object? convertAppointmentToObject(
      Object? customData, Appointment appointment) {
    return CalendarEvent(
      id: (customData as CalendarEvent).id,
      eventName: appointment.subject,
      from: appointment.startTime.toLocal(),
      to: appointment.endTime.toLocal(),
      background: appointment.color,
      isAllDay: appointment.isAllDay,
    );
  }
}

class CalendarEvent {
  final String id;
  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;

  CalendarEvent({
    required this.id,
    required this.eventName,
    required this.from,
    required this.to,
    required this.background,
    required this.isAllDay,
  });
}
