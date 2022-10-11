import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/crud/domain/usecase/get_user_usecase.dart';

void main() {
  late GetUsersUseCase useCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = GetUsersUseCase(mockUserRepository);
  });
}
