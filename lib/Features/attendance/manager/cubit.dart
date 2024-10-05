import 'dart:developer';

import 'package:easy_hr/Features/attendance/manager/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());

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
    print('supportState is $supportState');
  }

  Future<void> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
      print('canCheckBiometrics is $canCheckBiometrics');
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print('canCheckBiometrics is $canCheckBiometrics');
      print(e);
    }
    canCheckBiometrics = canCheckBiometrics;
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      print('availableBiometrics is $availableBiometrics');
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print('availableBiometrics is $availableBiometrics');
      print(e);
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
}
