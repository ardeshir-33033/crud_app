import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';

class AddEditCustomerPage extends StatelessWidget {
  AddEditCustomerPage({Key? key}) : super(key: key);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bankAccountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        hint: 'First Name',
                        textEditingController: firstNameController),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: CustomTextField(
                        hint: 'Last Name',
                        textEditingController: lastNameController),
                  ),
                ],
              ),
              CustomTextField(
                  hint: "Phone Number",
                  textEditingController: phoneNumberController),
              CustomTextField(
                  hint: "Email", textEditingController: emailController),
              CustomTextField(
                  hint: "Bank Account",
                  textEditingController: bankAccountNumberController),
            ],
          ),
        ),
      ),
    );
  }
}
