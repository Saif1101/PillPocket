import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'inspect_reminder_event.dart';
part 'inspect_reminder_state.dart';

class InspectReminderBloc extends Bloc<InspectReminderEvent, InspectReminderState> {
  InspectReminderBloc() : super(InspectReminderInitial()) {
    on<InspectReminderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
