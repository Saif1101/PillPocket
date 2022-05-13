import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title; 
  
  final bool showLogout; 
  final bool implyLeading;
  const CustomAppBar({
    this.implyLeading =true,
    
    this.showLogout = false,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
    
      
      automaticallyImplyLeading: implyLeading,
      iconTheme: IconThemeData(color: Colors.black),
      
   
      backgroundColor: Colors.white,
      elevation: 5,
      centerTitle: true,
      title: SizedBox(
        height: 68,
        child: SvgPicture.asset('assets/Logo(0).svg', fit: BoxFit.contain,),
        ),
      actions: [
        showLogout?IconButton(onPressed: ()=>{Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false)},
        icon: Icon(Icons.logout_sharp)
        ):SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}