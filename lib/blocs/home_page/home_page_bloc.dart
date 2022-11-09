import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:prescription_ocr/data/models/user/user_profile.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final UserRepository userRepository;

  HomePageBloc(this.userRepository) : super(HomePageState.initial()) {
    on<HomePageEvent>(_onHomePageEvent);
  }

  Future<void> _onHomePageEvent(
      HomePageEvent event, Emitter<HomePageState> emit) {
    return event.map(started: (_) async {
      emit(const HomePageState.loading());
      final currentUser = await userRepository.getSessionUser();
      emit(HomePageState.loaded(currentUser));
    });
  }
}
