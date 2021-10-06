// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$userNameAtom = Atom(name: '_LoginController.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginController.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginController.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$isLoggingAtom = Atom(name: '_LoginController.isLogging');

  @override
  bool get isLogging {
    _$isLoggingAtom.reportRead();
    return super.isLogging;
  }

  @override
  set isLogging(bool value) {
    _$isLoggingAtom.reportWrite(value, super.isLogging, () {
      super.isLogging = value;
    });
  }

  final _$checkUserNameValidationAsyncAction =
      AsyncAction('_LoginController.checkUserNameValidation');

  @override
  Future<void> checkUserNameValidation() {
    return _$checkUserNameValidationAsyncAction
        .run(() => super.checkUserNameValidation());
  }

  final _$sendEmailResetCodeAsyncAction =
      AsyncAction('_LoginController.sendEmailResetCode');

  @override
  Future<void> sendEmailResetCode() {
    return _$sendEmailResetCodeAsyncAction
        .run(() => super.sendEmailResetCode());
  }

  @override
  String toString() {
    return '''
userName: ${userName},
password: ${password},
email: ${email},
isLogging: ${isLogging}
    ''';
  }
}
