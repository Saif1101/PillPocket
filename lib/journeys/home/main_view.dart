import 'package:flutter/material.dart';
import 'package:prescription_ocr/journeys/add_prescription/add_prescription_page.dart';
import 'package:prescription_ocr/journeys/home/home_page.dart';
import 'package:prescription_ocr/journeys/profile/profile_page.dart';
import 'package:prescription_ocr/journeys/widgets/custom_bottom_navbar.dart';

// class MainPage extends StatefulWidget {
//   static const routeName = '/';
//   const MainPage({Key? key}) : super(key: key);

//   static Route route() {
//     return MaterialPageRoute(
//         settings: RouteSettings(name: routeName), builder: (_) => MainPage());
//   }

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int pageIndex = 0;
//   PageController pageController = PageController(initialPage: 1);

//   onPageChanged(int pageIndex) {
//     setState(() {
//       this.pageIndex = pageIndex;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Main', style: TextStyle(color: Colors.black),),
//         ),
//         bottomNavigationBar: CustomBottomNavBar(
//           pageController: pageController,
//         ),
//         body: PageView( // TODO:- If user is logged in :- display PageView or if not logged in -> show login. 
//           children: const [HomePage(),HomePage(), AddPrescriptionPage()], //Insert a page between profile and cart to make it the explore screen
//           physics: const NeverScrollableScrollPhysics(),
//           controller: pageController,
//           onPageChanged: onPageChanged,
//         ),
//       ),
//     );
//   }
// }