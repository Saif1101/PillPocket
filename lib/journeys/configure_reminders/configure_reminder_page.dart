import 'package:flutter/material.dart';

class ConfigureReminderPage extends StatelessWidget {

  const ConfigureReminderPage({ Key? key }) : super(key: key);

  static const String routeName = '/configure-reminder';

  

  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_)=>ConfigureReminderPage());
      }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}