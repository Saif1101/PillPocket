import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prescription_ocr/data/models/prescription/prescription_model.dart';
import 'package:prescription_ocr/repositories/prescription/prescription_repository.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

part 'recent_prescriptions_event.dart';
part 'recent_prescriptions_state.dart';
part 'recent_prescriptions_bloc.freezed.dart';

class RecentPrescriptionsBloc extends Bloc<RecentPrescriptionsEvent, RecentPrescriptionsState> {
  final PrescriptionRepository prescriptionRepository;
  final UserRepository userRepository;

  RecentPrescriptionsBloc(
    {required this.prescriptionRepository,required this.userRepository})
     : super(_Initial()) {
    on<RecentPrescriptionsEvent>(_onRecentPrescriptions);
  }

  Future<void> _onRecentPrescriptions(
    RecentPrescriptionsEvent event, Emitter<RecentPrescriptionsState> emit){

    return event.map(started: (_Started value) async {
      try{
        emit(const RecentPrescriptionsState.loading());
      final currentUser = await userRepository.getSessionUser();
      final prescriptions = await prescriptionRepository.getAllPrescription(currentUser.uId!);
      emit(RecentPrescriptionsState.loaded(prescriptions: prescriptions ));
      } on Exception catch (e) {
        emit(const RecentPrescriptionsState.error(
            'Error Ocurred'));
      }
    });
  }

  
}
