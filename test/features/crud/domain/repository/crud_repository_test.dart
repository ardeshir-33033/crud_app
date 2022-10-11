import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/crud/domain/entities/customer_entity.dart';
import 'package:mc_crud_test/features/crud/domain/repository/crud_repository.dart';
import 'package:mc_crud_test/features/crud/domain/usecase/get_user_usecase.dart';
import 'package:mockito/mockito.dart';

class MockCrudRepository extends Mock implements CrudRepository {}

void main() {
  late GetUsersUseCase useCase;
  late MockCrudRepository mockCrudRepository;

  setUp(() {
    mockCrudRepository = MockCrudRepository();
    useCase = GetUsersUseCase(mockCrudRepository);
  });

  CustomerEntity tUser = CustomerEntity(
    firstName: "firstname",
    lastName: "lastname",
    dateOfBirth: DateTime.parse("2022-10-12"),
    phoneNumber: "09373555973",
    email: "test@gmail.com",
    bankAccountNumber: "12356421356541",
  );
  List<CustomerEntity> tUserList = [tUser];

  test("should get users", () async {
    when(mockCrudRepository.getUsers())
        .thenAnswer((realInvocation) async => tUserList);

    final result = await useCase(null);

    expect(result, tUserList);
    verify(mockCrudRepository.getUsers());
  });
}
