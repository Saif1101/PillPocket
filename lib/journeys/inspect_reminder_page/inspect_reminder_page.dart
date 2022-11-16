import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/blocs/bloc/inspect_reminder_bloc.dart';
import 'package:prescription_ocr/blocs/home_page/home_page_bloc.dart';
import 'package:prescription_ocr/common/extensions/date_extension.dart';

import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/data/models/reminder/reminder_model.dart';
import 'package:prescription_ocr/journeys/common_widgets/BlackTextHeader.dart';

import 'package:prescription_ocr/journeys/common_widgets/GreyTextInputBoxWithHeader.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/medicines/medicines_widget.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/reminder_created_page.dart';

import 'package:prescription_ocr/journeys/inspect_reminder_page/widgets/DaySelectChip.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/widgets/MealCombinationButton.dart';
import 'package:prescription_ocr/journeys/widgets/circular_progress_indicator.dart';
import 'package:prescription_ocr/repositories/notifications/notifications_repository.dart';

import 'package:prescription_ocr/repositories/reminder/reminder_repository.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';
import 'package:textfield_tags/textfield_tags.dart';

class InspectReminderPage extends StatefulWidget {
  final ReminderModel? reminderModel;
  const InspectReminderPage({Key? key, this.reminderModel}) : super(key: key);

  static const String routeName = '/inspect-reminder';

  static Route route(ReminderModel? reminderModel) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => InspectReminderPage(
              reminderModel: reminderModel,
            ));
  }

  @override
  State<InspectReminderPage> createState() => _InspectReminderPageState();
}

class _InspectReminderPageState extends State<InspectReminderPage> {
  final ReminderModel _reminderModel = ReminderModel();

  List<String> tags = [];
  late TextfieldTagsController _controller;
  late double _distanceToField;

  late TextEditingController _titleController;
  late TextEditingController _noteController;
  late TextEditingController _causeController;
  

  Map<String, bool> selectedDays = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
    'Everyday': false,
  };

  Map<String, bool> mealCombination = {
    'Before': false,
    'With': false,
    'After': false,
  };

  List<DateTime> reminderTimes = [];

  void selectDay(bool value, String day) {
    if (day == 'Everyday') {
      selectedDays["Everyday"] = value;
      selectedDays.forEach(
        (key, prevValue) {
          if (key != 'Everyday' && value == true) {
            selectedDays[key] = false;
          }
        },
      );
    } else {
      selectedDays['Everyday'] = false;
      selectedDays[day] = value;
    }
    setState(() {});
  }

  void setMealCombination(bool value, String label) {
    print("Bool label value before: ${mealCombination[label]}");
    print("print incoming value: ${!value} ");
    mealCombination[label] = !value;
    print("After assignment: $mealCombination ");
  }

  late GlobalKey<TagsState> _tagStateKey;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
    _titleController = TextEditingController();
    _noteController = TextEditingController();
    _causeController = TextEditingController();
    _tagStateKey = GlobalKey();
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && !reminderTimes.contains(timeOfDay)) {
      setState(() {
        reminderTimes.add(DateTime.now().toDateTime(timeOfDay));
      });
    }
  }

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
        RepositoryProvider(
          create: (context) =>NotificationsRepository(),
        ),
      ],
      child: BlocProvider<InspectReminderBloc>(
        create: (context) => InspectReminderBloc(
            reminderRepository:
                RepositoryProvider.of<ReminderRepository>(context), userRepository: RepositoryProvider.of<UserRepository>(context), notificationsRepository: RepositoryProvider.of<NotificationsRepository>(context))
          ..add(InspectReminderEvent.started(_reminderModel)),
        child: BlocConsumer<InspectReminderBloc, InspectReminderState>(
          listener: (context, state) {
            
          },
          builder: (context, state) {
            return state.maybeMap(
              submitted: (value) {
                return ReminderCreatedConfirmationPage();
              },
              initial: (state) {
              
              return Scaffold(
                body: Center(
                  child: LoadingWidget(),
                ),
              );
            }, loading: (value) {
              return Scaffold(
                body: Center(
                  child: LoadingWidget(),
                ),
              );
            }, loaded: (state) {
              return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    iconTheme: const IconThemeData(
                      color: Colors.black, //change your color here
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          ReminderModel rem = ReminderModel(
                            notificationId: Random(DateTime.now().microsecondsSinceEpoch).nextInt(30),
                            mealCombination: mealCombination,
                            reminderTimes: reminderTimes,
                            selectedDays: selectedDays,
                            cause: _causeController.text,
                            medicines: tags,
                            reminderTitle: _titleController.text,
                            note: _noteController.text,
                          );
                          BlocProvider.of<InspectReminderBloc>(context)
                              .add(InspectReminderEvent.submitted(rem));
                        },
                        child: SizedBox(
                          width: 65,
                          height: 75,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8),
                            child: Material(
                              color: ThemeColors.primaryGreen,
                              elevation: 5,
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: SvgPicture.asset(
                                  'assets/tick_white.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create \nReminder',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GreyTextInputBoxWithHeader(
                              controller: _titleController,
                              header: "Title",
                              hintText: "Add a title",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GreyTextInputBoxWithHeader(
                              controller: _causeController,
                              header: "Cause",
                              hintText: "Add a cause",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const BlackTextHeader(header: 'Medicine(s)'),
                            MedicineNameTags(
                                controller: _controller,
                                distanceToField: _distanceToField),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const BlackTextHeader(
                                    header: 'Reminder Time(s)'),
                                IconButton(
                                    onPressed: () {
                                      _selectTime(context);
                                    },
                                    icon: const Icon(
                                      Icons.add_box_rounded,
                                      color: ThemeColors.primaryGreen,
                                    ))
                              ],
                            ),
                            reminderTimes.isNotEmpty
                                ? SizedBox(
                                    height: ScreenUtil.screenHeight / 6,
                                    child: GridView.count(
                                        shrinkWrap: true,
                                        childAspectRatio: 3,
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 2.0,
                                        //mainAxisSpacing: 2.0,
                                        children: List.generate(
                                            reminderTimes.length, (index) {
                                          return Chip(
                                            elevation: 0,
                                            labelPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 6, vertical: 1),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.zero),
                                            backgroundColor:
                                                ThemeColors.primaryGrey,
                                            label: Text(
                                              reminderTimes[index].getTime(),
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            deleteIcon:
                                                const Icon(Icons.cancel),
                                            onDeleted: () {
                                              setState(() {
                                                reminderTimes.remove(
                                                    reminderTimes[index]);
                                              });
                                            }, //Text
                                          );
                                        })),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              height: 10,
                            ),
                            GreyTextInputBoxWithHeader(
                              hintText: 'Add a note',
                              header: 'Notes',
                              controller: _noteController,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const BlackTextHeader(header: 'Duration'),
                            Align(
                                alignment: Alignment.center,
                                child: DaySelectChip(
                                  day: 'Everyday',
                                  isSelected: selectedDays['Everyday']!,
                                  onTap: selectDay,
                                )),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 32.0),
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  'OR',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 32.0),
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                spacing: 5.0,
                                children: <Widget>[
                                  DaySelectChip(
                                      onTap: selectDay,
                                      day: 'Monday',
                                      isSelected: selectedDays['Monday']!),
                                  DaySelectChip(
                                      onTap: selectDay,
                                      day: 'Tuesday',
                                      isSelected: selectedDays['Tuesday']!),
                                  DaySelectChip(
                                      onTap: selectDay,
                                      day: 'Wednesday',
                                      isSelected: selectedDays['Wednesday']!),
                                  DaySelectChip(
                                      onTap: selectDay,
                                      day: 'Thursday',
                                      isSelected: selectedDays['Thursday']!),
                                  DaySelectChip(
                                      onTap: selectDay,
                                      day: 'Friday',
                                      isSelected: selectedDays['Friday']!),
                                  DaySelectChip(
                                      onTap: selectDay,
                                      day: 'Saturday',
                                      isSelected: selectedDays['Saturday']!),
                                  DaySelectChip(
                                      onTap: selectDay,
                                      day: 'Sunday',
                                      isSelected: selectedDays['Sunday']!),
                                ]),
                            const SizedBox(
                              height: 10,
                            ),
                            const BlackTextHeader(header: 'Pre/With/Post Meal'),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setMealCombination(
                                          mealCombination['Before']!, 'Before');
                                      setState(() {});
                                    },
                                    child: MealCombinationButton(
                                      isSelected: mealCombination['Before']!,
                                      label: 'Before',
                                    )), //
                                GestureDetector(
                                    onTap: () {
                                      setMealCombination(
                                          mealCombination['With']!, 'With');
                                      setState(() {});
                                    },
                                    child: MealCombinationButton(
                                      isSelected: mealCombination['With']!,
                                      label: 'With',
                                    )), //
                                GestureDetector(
                                    onTap: () {
                                      setMealCombination(
                                          mealCombination['After']!, 'After');
                                      setState(() {});
                                    },
                                    child: MealCombinationButton(
                                      isSelected: mealCombination['After']!,
                                      label: 'After',
                                    )), //
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ]),
                    ),
                  ));
            }, orElse: () {
              print("Inside undef State");
              return const Center(child: Text('Undefined State'));
            });
          },
        ),
      ),
    );
  }
}



/*
SizedBox(
               height: 100,
      
               child: GridView.builder(
                
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: ScreenUtil.screenWidth,
        
        
      ),
      itemCount: selectedTimes.length,
      itemBuilder: (BuildContext context, int index) {
        
        return Chip(
          labelPadding: EdgeInsets.all(4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            elevation: 20,
            padding: EdgeInsets.all(8),
            backgroundColor: ThemeColors.primaryGrey,
            shadowColor: Colors.black,//CircleAvatar
            label: Text(
                selectedTimes[index].format(context),
                style: TextStyle(fontSize: 20),
            ),
            deleteIcon: Icon(Icons.cancel), 
            onDeleted: (){
               setState(() {
                selectedTimes.remove(selectedTimes[index]);
              });
            }, //Text
          );
      }
          ),
             )
*/
