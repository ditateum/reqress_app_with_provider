import 'package:equatable/equatable.dart';

import 'package:reqress_app/models/custom_error.dart';
import 'package:reqress_app/models/user_model.dart';

enum UserStatus {
  initial,
  loading,
  loaded,
  error,
}

class UsersState extends Equatable {
  const UsersState({
    required this.status,
    required this.error,
    required this.users,
  });

  factory UsersState.initial() => const UsersState(
        status: UserStatus.initial,
        error: CustomError(),
        users: [],
      );

  final CustomError error;
  final UserStatus status;
  final List<User> users;

  @override
  List<Object> get props => [error, status, users];

  UsersState copyWith({
    CustomError? error,
    UserStatus? status,
    List<User>? users,
  }) {
    return UsersState(
      error: error ?? this.error,
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }

  @override
  String toString() =>
      'UsersState(error: $error, status: $status, users: $users)';
}
