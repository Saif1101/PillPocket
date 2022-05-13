import 'package:flutter/material.dart';
import 'package:prescription_ocr/common/theme_colors.dart';

import 'package:textfield_tags/textfield_tags.dart';

class MedicineNameTags extends StatelessWidget {
  const MedicineNameTags({
    Key? key,
    required TextfieldTagsController controller,
    required double distanceToField,
  }) : _controller = controller, _distanceToField = distanceToField, super(key: key);

  final TextfieldTagsController _controller;
  final double _distanceToField;

  @override
  Widget build(BuildContext context) {
    return TextFieldTags(
      textfieldTagsController: _controller,
      initialTags: const [
      ],
      textSeparators: const [' ', ','],
      letterCase: LetterCase.normal,
      validator: (String tag) {
        if (_controller.getTags!.contains(tag)) {
          return 'Medicine already added.';
        }
        return null;
      },
      inputfieldBuilder:
          (context, tec, fn, error, onChanged, onSubmitted) {
        return ((context, sc, tags, onTagDelete) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: tec,
              focusNode: fn,
              decoration: InputDecoration(
                isDense: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                //helperText: 'Enter language...',
                helperStyle: const TextStyle(
                  color: ThemeColors.primaryGreen,
                ),
                hintText: _controller.hasTags ? '' : "Enter medicine(s)",
                errorText: error,
                prefixIconConstraints:
                    BoxConstraints(maxWidth: _distanceToField * 0.74),
                prefixIcon: tags.isNotEmpty
                    ? SingleChildScrollView(
                        controller: sc,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: tags.map((String tag) {
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: ThemeColors.primaryGrey,
                            ),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    '$tag',
                                    style: const TextStyle(
                                        color: Colors.black),
                                  ),
                                  onTap: () {
                                    print("$tag selected");
                                  },
                                ),
                                const SizedBox(width: 4.0),
                                InkWell(
                                  child: const Icon(
                                    Icons.cancel,
                                    size: 14.0,
                                    color: Colors.black,
                                  ),
                                  onTap: () {
                                    onTagDelete(tag);
                                  },
                                )
                              ],
                            ),
                          );
                        }).toList()),
                      )
                    : null,
              ),
              onChanged: onChanged,
              onSubmitted: onSubmitted,
            ),
          );
        });
      },
    );
  }
}