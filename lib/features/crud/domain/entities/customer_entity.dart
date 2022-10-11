class CustomerEntity {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String bankAccountNumber;
  DateTime dateOfBirth;

  CustomerEntity({
    required this.firstName,
    required this.phoneNumber,
    required this.bankAccountNumber,
    required this.dateOfBirth,
    required this.email,
    required this.lastName,
  });
}
