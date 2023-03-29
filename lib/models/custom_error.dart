import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  const CustomError({
    this.errMsg = '',
  });

  final String errMsg;

  @override
  List<Object> get props => [errMsg];

  @override
  String toString() => 'CustomError(errMsg: $errMsg)';
}
