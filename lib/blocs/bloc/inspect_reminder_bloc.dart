import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prescription_ocr/data/models/reminder/reminder_model.dart';
import 'package:prescription_ocr/repositories/notifications/notifications_repository.dart';
import 'package:prescription_ocr/repositories/reminder/reminder_repository.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

part 'inspect_reminder_event.dart';
part 'inspect_reminder_state.dart';
part 'inspect_reminder_bloc.freezed.dart';

class InspectReminderBloc extends Bloc<InspectReminderEvent, InspectReminderState> {
  final ReminderRepository reminderRepository; 
  final UserRepository userRepository; 
  final NotificationsRepository notificationsRepository; 

  InspectReminderBloc({required this.notificationsRepository, required this.userRepository,required this.reminderRepository}) : super(_Initial()) {
    on<InspectReminderEvent>(_onInspectReminderEvent);
  }

  Future<void> _onInspectReminderEvent(
    InspectReminderEvent event, 
    Emitter<InspectReminderState> emit, 
  ){
    return event.map(
      started: (state)async{
        emit(InspectReminderState.loaded(state.reminderModel));
      }, 
      submitted:(state)async{
        emit(InspectReminderState.loading());
        final user =await userRepository.getSessionUser();
        final uploadResponse = await reminderRepository.save(user.uId!, event.reminderModel!);
        final setNotification = await notificationsRepository.createReminder(event.reminderModel!);
        emit(InspectReminderState.submitted());

      });
  }
}
