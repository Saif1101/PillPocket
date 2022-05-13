import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final PageController pageController; 
  
  const CustomBottomNavBar({
    required this.pageController, 
    Key? key,
  }) : super(key: key);

  navigationOnTap(int index){
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: 1,
      buttonBackgroundColor: Color.fromARGB(255, 245, 245, 245),
      items: const <Widget>[
        Icon(Icons.person, size: 30, color: Colors.black,),
        Icon(Icons.home, size: 30, color: Colors.black,),
        Icon(Icons.add_a_photo, size: 30, color: Colors.black,),
        
      ],
      onTap: (index){
        print('navigating to $index');
        navigationOnTap(index); 
      },
      backgroundColor: Colors.white,
    );
  }
}