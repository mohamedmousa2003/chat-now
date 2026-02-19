// import 'package:equatable/equatable.dart';
//
// sealed class BaseState<T> extends Equatable {
//   const BaseState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class BaseLoading<T> extends BaseState<T> {
//   const BaseLoading();
// }
//
// class BaseSuccess<T> extends BaseState<T> {
//   final T data;
//   const BaseSuccess(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
//
// class BaseError<T> extends BaseState<T> {
//   final String message;
//   final Object? exception;
//
//   const BaseError({required this.message, this.exception});
//
//   @override
//   List<Object?> get props => [message, exception];
// }
