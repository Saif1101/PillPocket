import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrescriptionsList extends StatelessWidget {
  const PrescriptionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20,
        );
      },
    );
  }
}