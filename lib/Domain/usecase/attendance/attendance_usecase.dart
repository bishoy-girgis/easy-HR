import 'package:dartz/dartz.dart';

import '../../../Core/error/failure.dart';
import '../../repositories/attendance/attendance_repository.dart';

class AttendanceUseCase {
  final AttendanceRepository attendanceRepository;

  AttendanceUseCase(this.attendanceRepository);

  Future<Either<Failure, String>> execute({
    required int attendType,
    required String date,
  }) async {
    return await attendanceRepository.attend(
        attendType: attendType, date: date);
  }
}
