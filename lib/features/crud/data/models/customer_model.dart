import 'package:mc_crud_test/features/crud/domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String bankAccountNumber,
    required DateTime dateOfBirth,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          dateOfBirth: dateOfBirth,
          bankAccountNumber: bankAccountNumber,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        firstName: json["Firstname"],
        lastName: json["Lastname"],
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        phoneNumber: json["PhoneNumber"],
        email: json["Email"],
        bankAccountNumber: json["BankAccountNumber"],
      );

  Map<String, dynamic> toJson() => {
        "Firstname": firstName,
        "Lastname": lastName,
        "DateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "PhoneNumber": phoneNumber,
        "Email": email,
        "BankAccountNumber": bankAccountNumber,
      };

  static List<CustomerModel> listFromJson(dynamic json) {
    if (json != null) {
      return json.map<CustomerModel>((j) {
        return CustomerModel.fromJson(j);
      }).toList();
    }
    return [];
  }
}
