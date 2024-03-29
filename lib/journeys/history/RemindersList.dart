import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prescription_ocr/blocs/upcoming_reminders/upcoming_reminders_bloc.dart';
import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/journeys/common_widgets/EditDeleteButtonBar.dart';
import 'package:prescription_ocr/journeys/common_widgets/ReminderCardInformation.dart';
import 'package:prescription_ocr/journeys/widgets/circular_progress_indicator.dart';
import 'package:prescription_ocr/journeys/widgets/error_retry_button.dart';
import 'package:prescription_ocr/repositories/reminder/reminder_repository.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

class RemindersList extends StatelessWidget {
  const RemindersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ReminderRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) => UpcomingRemindersBloc(
            reminderRepository:
                RepositoryProvider.of<ReminderRepository>(context),
            userRepository: RepositoryProvider.of<UserRepository>(context))..add(const UpcomingRemindersEvent.started()),
        child: BlocConsumer<UpcomingRemindersBloc, UpcomingRemindersState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.maybeMap(
              loaded:(value) {
                 final reminders = value.reminders ?? [];
              return reminders.isEmpty
                  ? const SizedBox(
                      height: 250,
                      child: Center(
                        child: Text('No Reminders Found'),
                      ),
                    )
                  : SizedBox(                      
                      width: ScreenUtil.screenWidth,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: reminders.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Expanded(
                                child: ReminderCardInformation(
                                  reminderModel: reminders.elementAt(index),
                                ),
                              ),
                              EditDeleteButtonBar(),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    );
              },loading: (state) {
              return SizedBox(height:250, child: const Center(child: LoadingWidget()));
            }, error: (value) {
              return Center(
                child: ErrorButton(
                    buttonText: "Couldn't Load Profile",
                    function: () =>
                        BlocProvider.of<UpcomingRemindersBloc>(context)
                            .add(const UpcomingRemindersEvent.started())),
              );
            },
              orElse: (){
                return const Center(child: Text('Undefined State'));
              }
              );
          },
        ),
      ),
    );
  }
}
