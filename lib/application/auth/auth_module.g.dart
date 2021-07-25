// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_module.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthModule on AuthModuleBase, Store {
  final _$autovalidateAtom = Atom(name: 'AuthModuleBase.autovalidate');

  @override
  bool get autovalidate {
    _$autovalidateAtom.reportRead();
    return super.autovalidate;
  }

  @override
  set autovalidate(bool value) {
    _$autovalidateAtom.reportWrite(value, super.autovalidate, () {
      super.autovalidate = value;
    });
  }

  final _$isSubmittingAtom = Atom(name: 'AuthModuleBase.isSubmitting');

  @override
  bool get isSubmitting {
    _$isSubmittingAtom.reportRead();
    return super.isSubmitting;
  }

  @override
  set isSubmitting(bool value) {
    _$isSubmittingAtom.reportWrite(value, super.isSubmitting, () {
      super.isSubmitting = value;
    });
  }

  final _$buttonIndexAtom = Atom(name: 'AuthModuleBase.buttonIndex');

  @override
  int get buttonIndex {
    _$buttonIndexAtom.reportRead();
    return super.buttonIndex;
  }

  @override
  set buttonIndex(int value) {
    _$buttonIndexAtom.reportWrite(value, super.buttonIndex, () {
      super.buttonIndex = value;
    });
  }

  final _$passwordFieldHasFocusAtom =
      Atom(name: 'AuthModuleBase.passwordFieldHasFocus');

  @override
  bool get passwordFieldHasFocus {
    _$passwordFieldHasFocusAtom.reportRead();
    return super.passwordFieldHasFocus;
  }

  @override
  set passwordFieldHasFocus(bool value) {
    _$passwordFieldHasFocusAtom.reportWrite(value, super.passwordFieldHasFocus,
        () {
      super.passwordFieldHasFocus = value;
    });
  }

  final _$emailFieldHasFocusAtom =
      Atom(name: 'AuthModuleBase.emailFieldHasFocus');

  @override
  bool get emailFieldHasFocus {
    _$emailFieldHasFocusAtom.reportRead();
    return super.emailFieldHasFocus;
  }

  @override
  set emailFieldHasFocus(bool value) {
    _$emailFieldHasFocusAtom.reportWrite(value, super.emailFieldHasFocus, () {
      super.emailFieldHasFocus = value;
    });
  }

  final _$emailAddressAtom = Atom(name: 'AuthModuleBase.emailAddress');

  @override
  EmailAddress? get emailAddress {
    _$emailAddressAtom.reportRead();
    return super.emailAddress;
  }

  @override
  set emailAddress(EmailAddress? value) {
    _$emailAddressAtom.reportWrite(value, super.emailAddress, () {
      super.emailAddress = value;
    });
  }

  final _$passwordAtom = Atom(name: 'AuthModuleBase.password');

  @override
  Password? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(Password? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$authStateAtom = Atom(name: 'AuthModuleBase.authState');

  @override
  AuthState get authState {
    _$authStateAtom.reportRead();
    return super.authState;
  }

  @override
  set authState(AuthState value) {
    _$authStateAtom.reportWrite(value, super.authState, () {
      super.authState = value;
    });
  }

  final _$authFailureOrSuccessOptionAtom =
      Atom(name: 'AuthModuleBase.authFailureOrSuccessOption');

  @override
  Option<Either<AuthFailure, Unit>?>? get authFailureOrSuccessOption {
    _$authFailureOrSuccessOptionAtom.reportRead();
    return super.authFailureOrSuccessOption;
  }

  @override
  set authFailureOrSuccessOption(Option<Either<AuthFailure, Unit>?>? value) {
    _$authFailureOrSuccessOptionAtom
        .reportWrite(value, super.authFailureOrSuccessOption, () {
      super.authFailureOrSuccessOption = value;
    });
  }

  final _$registerWithEmailAndPasswordPressesAsyncAction =
      AsyncAction('AuthModuleBase.registerWithEmailAndPasswordPresses');

  @override
  Future<void> registerWithEmailAndPasswordPresses() {
    return _$registerWithEmailAndPasswordPressesAsyncAction
        .run(() => super.registerWithEmailAndPasswordPresses());
  }

  final _$signInWithEmailAndPasswordPressesAsyncAction =
      AsyncAction('AuthModuleBase.signInWithEmailAndPasswordPresses');

  @override
  Future<void> signInWithEmailAndPasswordPresses() {
    return _$signInWithEmailAndPasswordPressesAsyncAction
        .run(() => super.signInWithEmailAndPasswordPresses());
  }

  final _$signinAsyncAction = AsyncAction('AuthModuleBase.signin');

  @override
  Future<void> signin(String emailStr, String passwordStr) {
    return _$signinAsyncAction.run(() => super.signin(emailStr, passwordStr));
  }

  final _$registerAsyncAction = AsyncAction('AuthModuleBase.register');

  @override
  Future<void> register(String emailStr, String passwordStr) {
    return _$registerAsyncAction
        .run(() => super.register(emailStr, passwordStr));
  }

  final _$authCheckRequestAsyncAction =
      AsyncAction('AuthModuleBase.authCheckRequest');

  @override
  Future<void> authCheckRequest() {
    return _$authCheckRequestAsyncAction.run(() => super.authCheckRequest());
  }

  final _$signOutAsyncAction = AsyncAction('AuthModuleBase.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$AuthModuleBaseActionController =
      ActionController(name: 'AuthModuleBase');

  @override
  void emailChanged({required String emailStr}) {
    final _$actionInfo = _$AuthModuleBaseActionController.startAction(
        name: 'AuthModuleBase.emailChanged');
    try {
      return super.emailChanged(emailStr: emailStr);
    } finally {
      _$AuthModuleBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordChanged({required String passwordStr}) {
    final _$actionInfo = _$AuthModuleBaseActionController.startAction(
        name: 'AuthModuleBase.passwordChanged');
    try {
      return super.passwordChanged(passwordStr: passwordStr);
    } finally {
      _$AuthModuleBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordFieldPresses() {
    final _$actionInfo = _$AuthModuleBaseActionController.startAction(
        name: 'AuthModuleBase.passwordFieldPresses');
    try {
      return super.passwordFieldPresses();
    } finally {
      _$AuthModuleBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emailFieldPresses() {
    final _$actionInfo = _$AuthModuleBaseActionController.startAction(
        name: 'AuthModuleBase.emailFieldPresses');
    try {
      return super.emailFieldPresses();
    } finally {
      _$AuthModuleBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
autovalidate: ${autovalidate},
isSubmitting: ${isSubmitting},
buttonIndex: ${buttonIndex},
passwordFieldHasFocus: ${passwordFieldHasFocus},
emailFieldHasFocus: ${emailFieldHasFocus},
emailAddress: ${emailAddress},
password: ${password},
authState: ${authState},
authFailureOrSuccessOption: ${authFailureOrSuccessOption}
    ''';
  }
}
