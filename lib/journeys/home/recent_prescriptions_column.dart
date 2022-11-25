import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prescription_ocr/blocs/recent_prescriptions/recent_prescriptions_bloc.dart';
import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/journeys/common_widgets/PrescriptionCardCondensed.dart';
import 'package:prescription_ocr/journeys/widgets/circular_progress_indicator.dart';
import 'package:prescription_ocr/journeys/widgets/error_retry_button.dart';
import 'package:prescription_ocr/repositories/prescription/prescription_repository.dart';
import 'package:prescription_ocr/repositories/reminder/reminder_repository.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

class RecentPrescriptionsColumn extends StatelessWidget {
  const RecentPrescriptionsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ReminderRepository(),
        ),
        RepositoryProvider(
          create: (context) => PrescriptionRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) => RecentPrescriptionsBloc(
            prescriptionRepository:
                RepositoryProvider.of<PrescriptionRepository>(context),
            userRepository: RepositoryProvider.of<UserRepository>(context))..add(const RecentPrescriptionsEvent.started()),
        child: BlocConsumer<RecentPrescriptionsBloc, RecentPrescriptionsState>(
          listener: (context, state) {
            state.mapOrNull(
              initial: (value) {
                BlocProvider.of<RecentPrescriptionsBloc>(context)
                    .add(const RecentPrescriptionsEvent.started());
              },
            );
          },
          builder: (context, state) {
            return state.maybeMap(loaded: (value) {
              final prescriptions = value.prescriptions ?? [];
              return prescriptions.isEmpty
                  ? const SizedBox(
                      height: 250,
                      child: Center(
                        child: Text('No Prescriptions Found'),
                      ),
                    )
                  : SizedBox(
                      width: ScreenUtil.screenWidth,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: prescriptions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PrescriptionCardCondensed(
                              prescriptionModel:
                                  prescriptions.elementAt(index));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    );
            }, loading: (state) {
              return const SizedBox(
                  height: 250, child: const Center(child: LoadingWidget()));
            }, error: (value) {
              return Center(
                child: ErrorButton(
                    buttonText: "Couldn't Load Profile",
                    function: () =>
                        BlocProvider.of<RecentPrescriptionsBloc>(context)
                            .add(const RecentPrescriptionsEvent.started())),
              );
            }, orElse: () {
              return const Center(child: Text('Undefined State'));
            });
          },
        ),
      ),
    );
  }
}
