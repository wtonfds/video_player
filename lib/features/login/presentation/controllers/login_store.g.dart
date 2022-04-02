// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$statusCodeAtom = Atom(name: '_LoginStoreBase.statusCode');

  @override
  int get statusCode {
    _$statusCodeAtom.reportRead();
    return super.statusCode;
  }

  @override
  set statusCode(int value) {
    _$statusCodeAtom.reportWrite(value, super.statusCode, () {
      super.statusCode = value;
    });
  }

  final _$logginAsyncAction = AsyncAction('_LoginStoreBase.loggin');

  @override
  Future<bool> loggin(String username, String password) {
    return _$logginAsyncAction.run(() => super.loggin(username, password));
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void codeUnauthorized() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.codeUnauthorized');
    try {
      return super.codeUnauthorized();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void codeOK() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.codeOK');
    try {
      return super.codeOK();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic verifyInternet() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.verifyInternet');
    try {
      return super.verifyInternet();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusCode: ${statusCode}
    ''';
  }
}
