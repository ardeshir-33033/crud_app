import 'package:mc_crud_test/features/crud/domain/entities/customer_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/crud_repository.dart';

class GetUsersUseCase implements UseCase<Future<List<CustomerEntity>>, void> {
  final CrudRepository crudRepository;

  GetUsersUseCase(this.crudRepository);

  @override
  Future<List<CustomerEntity>> call(void params) async {
    return await crudRepository.getUsers();
  }
}
