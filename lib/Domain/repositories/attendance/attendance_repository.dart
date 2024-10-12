import 'package:dartz/dartz.dart';

import '../../../Core/error/failure.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, String>> attend({
    required int attendType,
    required String date,
  });
}
