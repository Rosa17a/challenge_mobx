import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/i_auth_local_repository.dart';
import '../../domain/auth/value_objects.dart';

part 'auth_module.g.dart';

@injectable
class AuthModule = AuthModuleBase with _$AuthModule;

abstract class AuthModuleBase with Store {
  final IAuthFacade _authFacade;
  final ILocalAuthRepository _localAuthRepository;

  AuthModuleBase(this._authFacade, this._localAuthRepository);
  @observable
  bool autovalidate = false;

  @observable
  bool isSubmitting = false;

  @observable
  EmailAddress? emailAddress;
  @observable
  Password? password;
  @observable
  AuthState authState = AuthState.Initial;

  @observable
  Option<Either<AuthFailure, Unit>?>? authFailureOrSuccessOption;

  @action
  void emailChanged({required String emailStr}) {
    emailAddress = EmailAddress(emailStr);
  }

  @action
  void passwordChanged({required String passwordStr}) {
    password = Password(passwordStr);
  }

  @action
  Future<void> registerWithEmailAndPasswordPresses() async {
    isSubmitting = true;

    final authFailureOrSuccess =
        await _perfomActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.registerWithEmailAndPassword);

    isSubmitting = false;
    authFailureOrSuccessOption = optionOf(authFailureOrSuccess);
  }

  @action
  Future<void> signInWithEmailAndPasswordPresses() async {
    isSubmitting = true;
    final authFailureOrSuccess =
        await _perfomActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.signInWithEmailAndPassword);
    isSubmitting = false;
    authFailureOrSuccessOption = optionOf(authFailureOrSuccess);
  }

  @action
  Future<void> cacheUserData() async {
    await _localAuthRepository.cacheUserData(emailAddress!, password!);
  }

  @action
  Future<void> signin(String emailStr, String passwordStr) async {
    await _authFacade.signInWithEmailAndPassword(
      emailAddress: EmailAddress(emailStr),
      password: Password(passwordStr),
    );
    // optionOrFailure.fold((l) => null, (r) => null);
  }

  @action
  Future<void> register(String emailStr, String passwordStr) async {
    await _authFacade.registerWithEmailAndPassword(
      emailAddress: EmailAddress(emailStr),
      password: Password(passwordStr),
    );
  }

  @action
  Future<void> authCheckRequest() async {
    final userOption = await _authFacade.getSignedInUser();
    userOption.fold(
      () => authState = AuthState.Unauthenticated,
      (a) => authState = AuthState.Authenticated,
    );
  }

  @action
  Future<void> signOut() async {
    await _authFacade.signOut();
    await _localAuthRepository.deleteUserData();
    authState = AuthState.Unauthenticated;
  }

  Future<Either<AuthFailure, Unit>?>
      _perfomActionOnAuthFacadeWithEmailAndPassword(
          Future<Either<AuthFailure, Unit>> Function(
                  {required EmailAddress emailAddress,
                  required Password password})
              forwardedCall) async {
    autovalidate = true;
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isEmailValid = emailAddress?.isValid() ?? false;
    final isPasswordValid = password?.isValid() ?? false;
    if (isEmailValid && isPasswordValid) {
      failureOrSuccess = await forwardedCall(
        emailAddress: emailAddress!,
        password: password!,
      );
    }
    return failureOrSuccess;
  }
}

enum AuthState { Initial, Authenticated, Unauthenticated }
