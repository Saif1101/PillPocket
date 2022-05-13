import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:prescription_ocr/common/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/history/history_page.dart';
import 'package:prescription_ocr/journeys/home/widgets/DashboardGreenButton.dart';
import 'package:prescription_ocr/journeys/home/widgets/RichTextHeader.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/inspect_reminder_page.dart';
import 'package:prescription_ocr/journeys/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Allow Notifications'),
              content: Text('We need permission to show notifications to serve reminders for medicines'),
              actions: [
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: Text(
                    'Allow',
                    style: TextStyle(
                      color: ThemeColors.primaryGreen,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.primaryGreen,
        elevation: 12.0,
        child: Icon(Icons.camera_alt_outlined),
        onPressed: () {
          Navigator.pushNamed(context, '/add-prescription');
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.account_circle, size: 38, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context,ProfilePage.routeName);
              } //do something,
              ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichTextHeader(
                    lightText: 'Hello, ',
                    boldText: 'User!',
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            DashboardRow(),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                )),
                Align(
                    alignment: Alignment.centerRight,
                    child: RichTextHeader(
                      lightText: 'Upcoming ',
                      boldText: 'Reminders',
                    )),
                SizedBox(
                  width: 5,
                )
              ],
            ),
            Flexible(
              child: SizedBox(
                height: 250,
                width: ScreenUtil.screenWidth,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ReminderCardInformation();
                  }, separatorBuilder: (BuildContext context, int index) { 
                    return SizedBox(width: 10,);
                   },
                ),
              ),
            ),
            Row(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: RichTextHeader(
                      lightText: 'Recent ',
                      boldText: 'Prescriptions',
                    )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                )),
              ],
            ),
            SizedBox(
                width: ScreenUtil.screenWidth,
                child: Column(
                  children: [
                    PrescriptionCardCondensed(),
                    SizedBox(height: 10,),
                    PrescriptionCardCondensed(),
                    SizedBox(height: 10,),
                    PrescriptionCardCondensed(),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}

class ReminderCardCondensed2 extends StatelessWidget {
  const ReminderCardCondensed2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Prescription#A',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                  DateCard(),
                ],
              ),
            ],
          ),
          Text(
            '16:00',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
              Text(
                '16:00',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 50,
                width: 25,
                child: SvgPicture.asset(
                  'assets/pill_after_meal_gb.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}



class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      color: Colors.redAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Prescription#123',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.white),
            ),
            trailing: Text(
              '12/05/10',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          ListTile(
            leading: Icon(
              Icons.crop_3_2_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Medicine #1',
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.crop_3_2_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Medicine #2',
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.crop_3_2_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Medicine #3',
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardRow extends StatelessWidget {
  const DashboardRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      color: ThemeColors.primaryGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DashboardGreenButton(
            onTap: () {
              Navigator.pushNamed(context, HistoryPage.routeName);
            },
            text: 'History',
            icon: Icons.history_outlined,
          ),
          DashboardGreenButton(
            onTap: () {
              Navigator.pushNamed(context, InspectReminderPage.routeName);
            },
            text: 'Reminder',
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}



class DashboardRow2 extends StatelessWidget {
  const DashboardRow2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'History',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.history_rounded)
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Prescriptions',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.sticky_note_2_outlined)
          ],
        )
      ],
    );
  }
}
