import 'package:equatable/equatable.dart';

class VacationTypeEntity extends Equatable {
  VacationTypeEntity({
    this.vacationTypeId,
    this.vacationTypet,
    this.vacationTypeName,
    this.vacationTypeEName,
  });

  int? vacationTypeId;
  bool? vacationTypet;
  String? vacationTypeName;
  String? vacationTypeEName;

  @override
  List<Object?> get props {
    return [
      vacationTypeId,
      vacationTypet,
      vacationTypeName,
      vacationTypeEName,
    ];
  }
}
