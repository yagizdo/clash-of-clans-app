// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$profileAtom =
      Atom(name: '_ProfileStore.profile', context: context);

  @override
  Profile get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(Profile value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProfileStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchProfileAsyncAction =
      AsyncAction('_ProfileStore.fetchProfile', context: context);

  @override
  Future<void> fetchProfile(String tag) {
    return _$fetchProfileAsyncAction.run(() => super.fetchProfile(tag));
  }

  @override
  String toString() {
    return '''
profile: ${profile},
isLoading: ${isLoading}
    ''';
  }
}
