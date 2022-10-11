import 'dart:convert';

import 'package:mc_crud_test/core/errors/errors.dart';
import 'package:mc_crud_test/features/crud/domain/entities/customer_entity.dart';
import 'package:hive/hive.dart';

import '../models/customer_model.dart';

abstract class CustomerCrudDataSource {
  Future<List<CustomerEntity>> getUsers();
}

class CustomerCrudDataSourceImpl implements CustomerCrudDataSource {
  final Box box;

  CustomerCrudDataSourceImpl(this.box);

  @override
  Future<List<CustomerEntity>> getUsers() async {
    try {
      dynamic data = await box.get('data');
      return [
        CustomerEntity(
          firstName: "firstname",
          lastName: "lastname",
          dateOfBirth: DateTime.parse("2022-10-12"),
          phoneNumber: "09373555973",
          email: "test@gmail.com",
          bankAccountNumber: "12356421356541",
        )
      ];
      // return CustomerModel.listFromJson(jsonDecode(data));
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
