import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/core/validator/validator.dart';
import 'package:phone_number/phone_number.dart';

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
  CountryCode countryCode = CountryCode.fromCountryCode("IR");
  final _formKey = GlobalKey<FormState>();
  final PhoneNumberUtil plugin = PhoneNumberUtil();

  Validator validator = ValidatorImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                            textEditingController: firstNameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Empty!";
                              }
                            }),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: CustomTextField(
                            hint: 'Last Name',
                            textEditingController: lastNameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Empty!";
                              }
                            }),
                      ),
                    ],
                  ),
                  CustomTextField(
                      icon: CountryCodePicker(
                        onChanged: (val) async {
                          // setState(() {
                          countryCode = val;
                          // });
                        },
                        initialSelection: 'IR',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      validator: (val) {
                        // if (validatePhone(val ?? "")) {
                        //   return "Wrong Number!";
                        // }
                        return null;
                      },
                      hint: "Phone Number",
                      textEditingController: phoneNumberController),
                  CustomTextField(
                      readOnly: true,
                      onTap: () {
                        _showDatePicker(context);
                      },
                      keyboardType: TextInputType.text,
                      hint: "date of birth",
                      textEditingController: dateOfBirthController),
                  CustomTextField(
                    hint: "Email",
                    textEditingController: emailController,
                    validator: (val) {
                      if (!validator.validateEmail(val ?? "")) {
                        return "Email is not correct";
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    hint: "Bank Account",
                    textEditingController: bankAccountNumberController,
                    validator: (val) {
                      if (!validator.validateAccount(val ?? "")) {
                        return "Should be at least 8 numbers";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 45.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("yes");
                      }
                    },
                    child: const Text("Create User"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validatePhone(String num) async {
    bool isValid = await plugin.validate(num);
    return isValid;
  }

  _showDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.parse("1900-01-01"),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        dateOfBirthController.text = value.tString();
      }
    });
  }
}

extension ToString on DateTime {
  String tString() =>
      "${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
}
