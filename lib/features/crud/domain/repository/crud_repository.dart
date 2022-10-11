import 'package:mc_crud_test/features/crud/domain/entities/customer_entity.dart';

abstract class CrudRepository {
  Future<int> createUser(CustomerEntity customerEntity);
  Future<List<CustomerEntity>> getUsers();
}
