import '../../../Core/error/failure.dart';

abstract class AttendanceState {}

final class AttendanceInitial extends AttendanceState {}

final class AttendanceChangeState extends AttendanceState {}

final class LoadingOSFingerPrintState extends AttendanceState {}

final class SuccessOSFingerPrintState extends AttendanceState {}

final class ErrorOSFingerPrintState extends AttendanceState {
  String message;

  ErrorOSFingerPrintState({required this.message});
}

final class AttendanceLoading extends AttendanceState {}

final class AttendanceSuccess extends AttendanceState {
  String? message;

  AttendanceSuccess({required this.message});
}

final class AttendanceError extends AttendanceState {
  String? message;

  AttendanceError({required this.message});
}
