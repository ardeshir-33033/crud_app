import 'package:mc_crud_test/features/crud/domain/entities/customer_entity.dart';
import 'package:mc_crud_test/features/crud/domain/repository/crud_repository.dart';

class CrudRepositoryImpl extends CrudRepository {
  @override
  Future<int> createUser(CustomerEntity customerEntity) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<List<CustomerEntity>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
