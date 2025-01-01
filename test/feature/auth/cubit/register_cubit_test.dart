import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/feature/auth/data/auth_repo/auth_repo.dart';
import 'package:weisro/feature/auth/data/models/address_model.dart';
import 'package:weisro/feature/auth/data/models/success_register_model.dart';
import 'package:weisro/feature/auth/data/models/user_client_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:dio/dio.dart'; // Importing Dio for CancelToken

// Mock classes
class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late RegisterCubit registerCubit;
  late MockAuthenticationRepository mockAuthenticationRepository;

  // Create a dummy instance of UserClientModel
  const dummyUserClientModel = UserClientModel(
    firstName: "John",
    lastName: "Doe",
    email: "test@example.com",
    password: "password123",
    phone: "1234567890",
    address: Address(
      city: "Berlin",
      country: "Germany",
      postalCode: "10115",
      houseNumber: "42",
      street: "Main St",
    ),
  );

  // Register the fallback value for UserClientModel
  setUpAll(() {
    registerFallbackValue(
        dummyUserClientModel); // Register fallback value for UserClientModel

    // Register the fallback value for CancelToken (needed by Dio)
    registerFallbackValue(
        CancelToken()); // Register fallback value for CancelToken
  });

  // Set up the test environment
  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    registerCubit = RegisterCubit();

    // Prepare the RegisterCubit with mocked repository
    when(() => mockAuthenticationRepository.clientRegisterApi(any(), any()))
        .thenAnswer(
      (invocation) async =>
          right(const SuccessRegisterModel(id: "TEST", message: "Message")),
    );
  });
  blocTest<RegisterCubit, RegisterState>(
    'emits RegisterLoading and RegisterSuccess on successful registration',
    build: () {
      return registerCubit;
    },
    act: (cubit) async {
      await cubit
          .registerClient(); // Ensure registerClient emits the expected states
    },
    expect: () => [
      RegisterLoading(),
      isA<RegisterSuccess>(), // Expect RegisterSuccess state after successful registration
    ],
    verify: (_) {
      verify(() => mockAuthenticationRepository.clientRegisterApi(any(), any()))
          .called(1);
    },
  );

  blocTest<RegisterCubit, RegisterState>(
    'emits RegisterLoading and RegisterFailures on registration failure',
    build: () {
      when(() => mockAuthenticationRepository.clientRegisterApi(any(), any()))
          .thenAnswer((_) async => left(ErrorHandler.handleError("TEST")));

      return registerCubit;
    },
    act: (cubit) async {
      await cubit
          .registerClient(); // Ensure registerClient handles errors and emits RegisterFailures
    },
    expect: () => [
      RegisterLoading(),
      RegisterFailures(
          errMessage:
              'Registration failed'), // Expect RegisterFailures on error
    ],
    verify: (_) {
      verify(() => mockAuthenticationRepository.clientRegisterApi(any(), any()))
          .called(1);
    },
  );
}
