import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prescription_ocr/journeys/add_prescription/add_prescription_page.dart';
import 'package:prescription_ocr/journeys/add_prescription/prescription_review_page.dart';
import 'package:prescription_ocr/journeys/add_prescription/reminders_review_page.dart';
import 'package:prescription_ocr/journeys/auth/login_page.dart';
import 'package:prescription_ocr/journeys/configure_reminders/configure_reminder_page.dart';
import 'package:prescription_ocr/journeys/edit_prescription/edit_prescription.dart';
import 'package:prescription_ocr/journeys/history/history_page.dart';
import 'package:prescription_ocr/journeys/home/home_page.dart';
import 'package:prescription_ocr/journeys/inspect_prescription/inspect_prescription_page.dart';
import 'package:prescription_ocr/journeys/inspect_reminder_page/inspect_reminder_page.dart';
import 'package:prescription_ocr/journeys/profile/profile_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case AddPrescriptionPage.routeName:
        return AddPrescriptionPage.route();
      case PrescriptionReviewPage.routeName:
        return PrescriptionReviewPage.route();
      case ReminderReviewPage.routeName:
        return ReminderReviewPage.route();
      case ProfilePage.routeName: 
        return ProfilePage.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case EditPrescriptionPage.routeName: 
        return EditPrescriptionPage.route();
      case ConfigureReminderPage.routeName: 
        return ConfigureReminderPage.route();
      case HistoryPage.routeName: 
        return  HistoryPage.route();
      case InspectPrescriptionPage.routeName: 
        return InspectPrescriptionPage.route();
      case InspectReminderPage.routeName:
        return InspectReminderPage.route();
      default:
        print(settings.name);
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
            ));
  }
}