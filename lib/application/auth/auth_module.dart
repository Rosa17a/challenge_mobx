import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/i_auth_facade.dart';

import '../../domain/auth/value_objects.dart';

part 'auth_module.g.dart';

@injectable
class AuthModule = AuthModuleBase with _$AuthModule;

abstract class AuthModuleBase with Store {
  final IAuthFacade _authFacade;

  AuthModuleBase(this._authFacade);
  
  @observable
  bool autovalidate = false;

  @observable
  bool isSubmitting = false;
  @observable
  int buttonIndex = 0;
  @observable
  bool passwordFieldHasFocus = false;
  @observable
  bool emailFieldHasFocus = false;
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
  void passwordFieldPresses() {
    passwordFieldHasFocus = true;
    emailFieldHasFocus = false;
  }

  @action
  void emailFieldPresses() {
    passwordFieldHasFocus = false;
    emailFieldHasFocus = true;
  }

  @action
  Future<void> registerWithEmailAndPasswordPresses() async {
    buttonIndex = 1;
    isSubmitting = true;

    final authFailureOrSuccess =
        await _perfomActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.registerWithEmailAndPassword);

    isSubmitting = false;
    authFailureOrSuccessOption = optionOf(authFailureOrSuccess);
  }

  @action
  Future<void> signInWithEmailAndPasswordPresses() async {
    buttonIndex = 0;
    isSubmitting = true;
    final authFailureOrSuccess =
        await _perfomActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.signInWithEmailAndPassword);
    isSubmitting = false;
    authFailureOrSuccessOption = optionOf(authFailureOrSuccess);
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
