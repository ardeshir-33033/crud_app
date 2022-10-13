import 'package:flutter/material.dart';

import '../../../../core/consts/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.hint,
      required this.textEditingController,
      this.keyboardType = TextInputType.text,
      this.readOnly = false,
      this.onTap,
      this.validator,
      this.icon})
      : super(key: key);

  final TextEditingController textEditingController;
  final String hint;
  final bool readOnly;
  final TextInputType keyboardType;
  final Function? onTap;
  final String? Function(String?)? validator;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 12,
        child: Center(
          child: TextFormField(
            readOnly: readOnly,
            controller: textEditingController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
            decoration: InputDecoration(
              prefixIcon: icon,
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
            validator: validator,
          ),
        ),
      ),
    );
  }
}
