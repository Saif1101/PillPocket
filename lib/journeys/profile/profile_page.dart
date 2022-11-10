import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/blocs/authentication/auth_bloc.dart';
import 'package:prescription_ocr/blocs/profile_page/profile_page_bloc.dart';
import 'package:prescription_ocr/common/utils/screen_utils.dart';
import 'package:prescription_ocr/common/theme_colors.dart';
import 'package:prescription_ocr/journeys/common_widgets/GreyTextDisplayWithHeader.dart';
import 'package:prescription_ocr/journeys/widgets/circular_progress_indicator.dart';
import 'package:prescription_ocr/journeys/widgets/error_retry_button.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/profile-page';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
                  print('Logout');
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (Route<dynamic> route) => false);
                },
                icon: const Icon(Icons.logout))
          ],
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: RepositoryProvider(
          create: (context) => UserRepository(),
          child: BlocProvider<ProfilePageBloc>(
            create: (context) =>
                ProfilePageBloc(RepositoryProvider.of<UserRepository>(context))
                  ..add(const ProfilePageEvent.started()),
            child: BlocConsumer<ProfilePageBloc, ProfilePageState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return state.map(initial: ((_) {
                  return const Center(
                    child: LoadingWidget(),
                  );
                }), ProfileLoadedState: (state) {
                  final profile = state.userProfile;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 64.0,
                              backgroundImage:
                                  NetworkImage(profile.profilePhotoUrl!),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${profile.firstName} ${profile.lastName}",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil.screenWidth / 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GreyTextDisplayWithHeader(
                                  header: 'Age',
                                  displayText: "${profile.age}",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GreyTextDisplayWithHeader(
                                  header: 'Email',
                                  displayText: "${profile.emailId}",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GreyTextDisplayWithHeader(
                                  header: 'Phone',
                                  displayText: "${profile.mobileNumber}",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }, ErrorState: (value) {
                  return Center(
                    child: ErrorButton(
                        buttonText: "Couldn't Load Profile",
                        function: () =>
                            BlocProvider.of<ProfilePageBloc>(context)
                                .add(const ProfilePageEvent.started())),
                  );
                }, ProfileLoading: (value) {
                  return const Center(
                    child: LoadingWidget(),
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
