import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/common/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/medicines/medicines_widget.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/model/NotificationDayAndTime.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/widgets/DaySelectChip.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/widgets/MealCombinationButton.dart';
import 'package:prescription_ocr/journeys/profile/profile_page.dart';
import 'package:textfield_tags/textfield_tags.dart';

class InspectReminderPage extends StatefulWidget {
  const InspectReminderPage({Key? key}) : super(key: key);

  static const String routeName = '/inspect-reminder';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => InspectReminderPage());
  }

  @override
  State<InspectReminderPage> createState() => _InspectReminderPageState();
}

class _InspectReminderPageState extends State<InspectReminderPage> {
  List<String> tags = [];
  late TextfieldTagsController _controller;
  late double _distanceToField;

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

  List<TimeOfDay> selectedTimes = [];

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
      selectedDays[day] = value;
    }
    setState(() {});
  }

  void setMealCombination(bool value, String label){
    print("Meal combination : $label : $value");
    mealCombination[label]=value; 
    setState(() {});
  }

  GlobalKey<TagsState> _tagStateKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && !selectedTimes.contains(timeOfDay)) {
      setState(() {
        selectedTimes.add(timeOfDay);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          actions: [
            GestureDetector(
              onTap: () {
                print('Reminder submitted');
              },
              child: SizedBox(
                width: 65,
                height: 75,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                  child: Material(
                    color: ThemeColors.primaryGreen,
                    elevation: 5,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Create \nReminder',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GreyTextDisplayWithHeader(
                  header: "Title", displayText: "Lorem Ipsum"),
              SizedBox(
                height: 20,
              ),
              BlackTextHeader(header: 'Medicine(s)'),
              MedicineNameTags(
                  controller: _controller, distanceToField: _distanceToField),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  BlackTextHeader(header: 'Reminder Time(s)'),
                  IconButton(
                      onPressed: () {
                        _selectTime(context);
                      },
                      icon: Icon(
                        Icons.add_box_rounded,
                        color: ThemeColors.primaryGreen,
                      ))
                ],
              ),
              selectedTimes.isNotEmpty
                  ? SizedBox(
                      height: ScreenUtil.screenHeight / 6,
                      child: GridView.count(
                          shrinkWrap: true,
                          childAspectRatio: 3,
                          crossAxisCount: 3,
                          crossAxisSpacing: 2.0,
                          //mainAxisSpacing: 2.0,
                          children:
                              List.generate(selectedTimes.length, (index) {
                            return Chip(
                              elevation: 0,
                              labelPadding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),

                              backgroundColor: ThemeColors.primaryGrey,

                              label: Text(
                                selectedTimes[index].format(context),
                                style: TextStyle(fontSize: 18),
                              ),
                              deleteIcon: Icon(Icons.cancel),
                              onDeleted: () {
                                setState(() {
                                  selectedTimes.remove(selectedTimes[index]);
                                });
                              }, //Text
                            );
                          })),
                    )
                  : SizedBox.shrink(),
              SizedBox(
                height: 10,
              ),
              GreyTextDisplayWithHeader(
                  header: 'Notes',
                  displayText:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in"
                      " reprehenderit in voluptate velit esse "
                      "cillum dolore eu fugiat nulla pariatur."),
              SizedBox(
                height: 10,
              ),
              BlackTextHeader(header: 'Duration'),
              Align(
                alignment: Alignment.center,
                child: DaySelectChip(day: 'Everyday',isSelected: selectedDays['Everyday']!, onTap: selectDay,)
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 5.0,
                  children: <Widget>[
                    DaySelectChip(onTap: selectDay, day: 'Monday', isSelected: selectedDays['Monday']!),
                    DaySelectChip(onTap: selectDay, day: 'Tuesday', isSelected: selectedDays['Monday']!),
                    DaySelectChip(onTap: selectDay, day: 'Wednesday', isSelected: selectedDays['Wednesday']!),
                    DaySelectChip(onTap: selectDay, day: 'Thursday', isSelected: selectedDays['Thursday']!),
                    DaySelectChip(onTap: selectDay, day: 'Friday', isSelected: selectedDays['Friday']!),
                    DaySelectChip(onTap: selectDay, day: 'Saturday', isSelected: selectedDays['Saturday']!),
                    DaySelectChip(onTap: selectDay, day: 'Sunday', isSelected: selectedDays['Sunday']!),
                  ]),
              SizedBox(
                height: 10,
              ),
              BlackTextHeader(header: 'Pre/With/Post Meal'),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MealCombinationButton(isSelected: mealCombination['Before']!, label: 'before', onTap: setMealCombination), //
                  MealCombinationButton(isSelected: mealCombination['With']!, label: 'with', onTap: setMealCombination), //
                  MealCombinationButton(isSelected: mealCombination['After']!, label: 'after', onTap: setMealCombination), //
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ]),
          ),
        ));
  }
}





class GRBWGColorSwitchButton extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final bool isSelected;

  const GRBWGColorSwitchButton({
    required this.isSelected,
    required this.text,
    Key? key,
    required this.fontWeight,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4.0),
      decoration: BoxDecoration(
          color:
              isSelected ? ThemeColors.primaryGreen : ThemeColors.primaryGrey,
          borderRadius: BorderRadius.all(Radius.circular(55))),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontWeight: fontWeight,
          color: isSelected ? Colors.white : Colors.black,
          fontSize: fontSize,
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
