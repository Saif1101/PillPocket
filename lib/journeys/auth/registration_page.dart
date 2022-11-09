import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:prescription_ocr/blocs/authentication/auth_bloc.dart';

import 'package:prescription_ocr/data/models/user/registration_detail.dart';
import 'package:prescription_ocr/journeys/common_widgets/GreenWhitePageHeader.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  static const String routeName = '/registration';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const RegistrationPage());
  }

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _registrationDetail = RegistrationDetail();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GreenWhitePageHeader(
              text: 'New Here?\n Register.',
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 2.0, top: 8.0, bottom: 8.0),
              child: Text(
                'We\'re going to need a few pieces of information to help serve you better.',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      icon: Icon(Icons.person),
                      hintText: 'First Name',
                    ),
                    onSaved: (String? value) {
                      _registrationDetail.firstName = value;
                    },
                    validator: (String? value) {
                      return (value == null ? "Can't be empty" : null);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      icon: Icon(Icons.person),
                      hintText: 'Last Name',
                    ),
                    onSaved: (String? value) {
                      _registrationDetail.lastName = value;
                    },
                    validator: (String? value) {
                      return (value == null ? "Can't be empty" : null);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      icon: Icon(
                        Icons.phone,
                      ),
                      hintText: 'Mobile Number',
                    ),
                    onSaved: (String? value) {
                      _registrationDetail.mobileNumber = value;
                    },
                    validator: (String? value) {
                      return (value == null ? "Can't be empty" : null);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Age',
                      icon: Icon(
                        Icons.calendar_today,
                      ),
                    ),
                    onSaved: (String? value) {
                      _registrationDetail.age = value;
                    },
                    validator: (String? value) {
                      return (value == null ? "Can't be empty" : null);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final form = _formKey.currentState!;
                if (form.validate()) {
                  form.save();
                  print(_registrationDetail);
                  BlocProvider.of<AuthBloc>(context)
                      .add(RegistrationEvent(_registrationDetail));
                }
              },
              child: const Text('Register'),
            ),
          ]),
    );
  }
}
