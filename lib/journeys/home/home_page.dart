import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prescription_ocr/blocs/home_page/home_page_bloc.dart';

import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/data/models/user/user_profile.dart';
import 'package:prescription_ocr/journeys/common_widgets/PrescriptionCardCondensed.dart';
import 'package:prescription_ocr/journeys/common_widgets/ReminderCardInformation.dart';
import 'package:prescription_ocr/journeys/home/widgets/DashboardRow.dart';

import 'package:prescription_ocr/journeys/home/widgets/RichTextHeader.dart';

import 'package:prescription_ocr/journeys/profile/profile_page.dart';
import 'package:prescription_ocr/journeys/widgets/circular_progress_indicator.dart';
import 'package:prescription_ocr/journeys/widgets/error_retry_button.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

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
              content: Text(
                  'We need permission to show notifications to serve reminders for medicines'),
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
        child: RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            HomePageBloc(RepositoryProvider.of<UserRepository>(context))..add(HomePageEvent.started()),
        child: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            state.mapOrNull(
              initial: (value) {
                BlocProvider.of<HomePageBloc>(context)
                    .add(const HomePageEvent.started());
                return const Scaffold(
                  body: Center(child: LoadingWidget()),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              loaded: ((state) {
                return Scaffold(
                   
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: ThemeColors.primaryGreen,
                    elevation: 12.0,
                    child: const Icon(Icons.camera_alt_outlined),
                    onPressed: () {
                      Navigator.pushNamed(context, '/add-prescription');
                    },
                  ),
                  drawer: const Drawer(
                    backgroundColor: Colors.white,
                  ),
                  appBar: AppBar(
                     iconTheme: IconThemeData(color: Colors.black),
                    elevation: 0,
                    actions: [
                      IconButton(
                          icon: CircleAvatar(
                            backgroundImage: NetworkImage(
                                state.currentUser.profilePhotoUrl!),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, ProfilePage.routeName);
                          } //do something,
                          ),
                    ],
                  ),
                  body: HomePageBody(currentUser: state.currentUser),
                );
              }),
              loading: (state) {
                return const Scaffold(
                  body: Center(child: LoadingWidget()),
                );
              },
              error: (value) {
                return Scaffold(
                  body: Center(
                    child: ErrorButton(
                        buttonText: "Couldn't Load Profile",
                        function: () => BlocProvider.of<HomePageBloc>(context)
                            .add(const HomePageEvent.started())),
                  ),
                );
              },
              orElse: () {
                return const Scaffold(
                  body: Center(child: Text('Undefined State')),
                );
              },
            );
          },
        ),
      ),
    ));
  }
}

class HomePageBody extends StatelessWidget {
  final UserProfile currentUser;

  const HomePageBody({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  boldText: currentUser.firstName!,
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
              //TODO Reolace with stateful widget to display all reminders in a list view
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
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ReminderCardInformation();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
          ),
          //TODO Replace with stateful widget to display all reminders in a list view
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
                  SizedBox(
                    height: 10,
                  ),
                  PrescriptionCardCondensed(),
                  SizedBox(
                    height: 10,
                  ),
                  PrescriptionCardCondensed(),
                ],
              ))
        ],
      ),
    );
  }
}


// class ReminderCardCondensed2 extends StatelessWidget {
//   const ReminderCardCondensed2({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Prescription#A',
//                     style: GoogleFonts.roboto(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                       fontSize: 32,
//                     ),
//                   ),
//                   DateCard(),
//                 ],
//               ),
//             ],
//           ),
//           Text(
//             '16:00',
//             style: GoogleFonts.roboto(
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//               fontSize: 12,
//             ),
//           ),
//           Row(
//             children: [
//               Icon(
//                 Icons.keyboard_arrow_right,
//                 color: Colors.black,
//               ),
//               Text(
//                 '16:00',
//                 style: GoogleFonts.roboto(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 14,
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 25,
//                 child: SvgPicture.asset(
//                   'assets/pill_after_meal_gb.svg',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }



// class DashboardRow2 extends StatelessWidget {
//   const DashboardRow2({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'History',
//               style: TextStyle(fontSize: 22),
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Icon(Icons.history_rounded)
//           ],
//         ),
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Prescriptions',
//               style: TextStyle(fontSize: 22),
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Icon(Icons.sticky_note_2_outlined)
//           ],
//         )
//       ],
//     );
//   }
// }
