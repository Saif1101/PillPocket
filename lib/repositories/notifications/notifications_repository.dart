import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:prescription_ocr/data/models/reminder/reminder_model.dart';

class NotificationsRepository{

  Future<void> createReminder(ReminderModel reminderModel) async {
    print("Going to create a notification at ${reminderModel.reminderTimes![0].hour} ${reminderModel.reminderTimes![0].minute}");

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        
        id: reminderModel.notificationId!, 
        channelKey: 'scheduled_channel',
        title: reminderModel.reminderTitle, 
        body: reminderModel.note,
        notificationLayout: NotificationLayout.Default
        ),
        schedule: NotificationCalendar(
          repeats: true,
          weekday: 1,
          hour: reminderModel.reminderTimes![0].hour,
          minute:reminderModel.reminderTimes![0].minute ,
          second: 0,
          millisecond: 0,
        ),
        actionButtons: [
          NotificationActionButton(
            key: "MARK DONE", 
            label: 'Done'),
        ]
      );
  }
}