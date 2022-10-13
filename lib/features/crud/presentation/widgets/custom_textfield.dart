import 'package:flutter/material.dart';

import '../../../../core/consts/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.hint,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 12,
        child: Center(
          child: TextFormField(
            controller: textEditingController,
            autovalidateMode: AutovalidateMode.always,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(Constants.textFieldBorderRadius),
                  borderSide: const BorderSide(color: Colors.black54)),
              border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(Constants.textFieldBorderRadius),
                  borderSide: const BorderSide(color: Colors.red)),
              hintText: hint,
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return null;
            },
          ),
        ),
      ),
    );
  }
}
