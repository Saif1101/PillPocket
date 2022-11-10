import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prescription_ocr/data/models/reminder/reminder_model.dart';
import 'package:prescription_ocr/repositories/reminder/reminder_repository.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

part 'upcoming_reminders_event.dart';
part 'upcoming_reminders_state.dart';
part 'upcoming_reminders_bloc.freezed.dart';

class UpcomingRemindersBloc
    extends Bloc<UpcomingRemindersEvent, UpcomingRemindersState> {
  final ReminderRepository reminderRepository;
  final UserRepository userRepository;

  UpcomingRemindersBloc(
      {required this.reminderRepository, required this.userRepository})
      : super(_Initial()) {
    on<UpcomingRemindersEvent>(_onUpcomingRemindersEvent);
  }

  Future<void> _onUpcomingRemindersEvent(
      UpcomingRemindersEvent event, Emitter<UpcomingRemindersState> emit) {
        
    return event.map(started: (_Started value) async {
      try{
        emit(const UpcomingRemindersState.loading());
      final currentUser = await userRepository.getSessionUser();
      final reminders = await reminderRepository.getAllReminders(currentUser.uId!);
      emit(UpcomingRemindersState.loaded(reminders: reminders));
      } on Exception catch (e) {
        emit(const UpcomingRemindersState.error(
            'Error Ocurred'));
      }
    });
  }
}
