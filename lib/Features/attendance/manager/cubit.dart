import 'dart:developer';

import 'package:easy_hr/Features/attendance/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';

import '../../../Core/services/web_service.dart';
import '../../../Data/data_source/attendance/attendance_data_source.dart';
import '../../../Data/repository_imp/attendance/attendance_repo_imp.dart';
import '../../../Domain/repositories/attendance/attendance_repository.dart';
import '../../../Domain/usecase/attendance/attendance_usecase.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());
  late AttendanceDataSource attendanceDataSource =
      AttendanceDataSource(WebService().publicDio);
  late AttendanceRepository attendanceRepository =
      AttendanceRepositoryImp(attendanceDataSource);
  late AttendanceUseCase attendanceUseCase =
      AttendanceUseCase(attendanceRepository);

  static AttendanceCubit get(context) => BlocProvider.of(context);

  bool? attendanceIn = true;
  bool authenticated = false;

  final LocalAuthentication auth = LocalAuthentication();
  bool canCheckBiometrics = false;
  bool supportState = false;
  List<BiometricType> availableBiometrics = [];

  Future<void> isSupported() async {
    supportState = false;
    var value = await auth.isDeviceSupported();
    supportState = value;
  }

  Future<void> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
    }
    canCheckBiometrics = canCheckBiometrics;
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
    }
    availableBiometrics = availableBiometrics;
  }

  Future<void> osFingerPrint() async {
    emit(LoadingOSFingerPrintState());

    await isSupported();
    if (supportState) {
      await checkBiometrics();
      await getAvailableBiometrics();
      try {
        authenticated = await auth.authenticate(
          localizedReason: 'mobile_authentication',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: false,
          ),
        );
        if (authenticated) {
          emit(SuccessOSFingerPrintState());
        }
      } on PlatformException catch (e) {
        return;
      }
    } else {
      emit(ErrorOSFingerPrintState(message: 'method_not_supported'));
    }

    try {} catch (error) {
      log(error.toString());
      emit(ErrorOSFingerPrintState(message: "Unexpected error"));
    }
  }

  changeAttendance() {
    emit(AttendanceChangeState());
    attendanceIn = !attendanceIn!;
  }

  addAttendance() async {
    emit(AttendanceLoading());
    var result = await attendanceUseCase.execute(
      attendType: attendanceIn == true ? 0 : 1,
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
    result.fold((error) {
      debugPrint(error.message);
      emit(AttendanceError(message: error.message));
    }, (r) async {
      emit(AttendanceSuccess(message: r));
    });
  }
}
