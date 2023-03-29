import 'package:flutter/material.dart';
import 'package:reqress_app/models/custom_error.dart';

import 'package:reqress_app/providers/users_state.dart';
import 'package:reqress_app/repository/reqress_repository.dart';

class UsersProvider extends ChangeNotifier {
  UsersProvider({
    required this.repository,
  });

  final ReqresRepository repository;

  UsersState _state = UsersState.initial();

  UsersState get state => _state;

  Future<void> getUsers() async {
    _state = _state.copyWith(status: UserStatus.loading);

    notifyListeners();

    try {
      final result = await repository.getAllUserReqress();
      _state = _state.copyWith(
        status: UserStatus.loaded,
        users: result,
      );
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(
        status: UserStatus.error,
        error: e,
      );
      notifyListeners();
    }
  }
}
