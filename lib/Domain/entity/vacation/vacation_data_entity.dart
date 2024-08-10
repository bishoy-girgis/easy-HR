import 'package:equatable/equatable.dart';

class VacationDataEntity extends Equatable {
  VacationDataEntity({
    this.vacationId,
    this.vacationNumber,
    this.vacationDate,
    this.empId,
    this.vacationTypeId,
    this.dateFrom,
    this.dateTo,
    this.days,
    this.hourFrom,
    this.hourTo,
    this.hours,
    this.permitLeave,
    this.balanceBefore,
    this.balanceAfter,
    this.user,
    this.approved = true,
    this.approvedBy,
    this.approveDate,
    this.notes,
    this.companyId,
    this.vacationName,
    this.vacationEName,
  });

  int? vacationId;
  String? vacationNumber;
  String? vacationDate;
  int? empId;
  int? vacationTypeId;
  String? dateFrom;
  String? dateTo;
  int? days;
  String? hourFrom;
  String? hourTo;
  String? hours;
  int? permitLeave;
  int? balanceBefore;
  int? balanceAfter;
  String? user;
  bool approved;
  String? approvedBy;
  String? approveDate;
  String? notes;
  int? companyId;
  String? vacationName;
  String? vacationEName;


  @override
  List<Object?> get props {
    return [
      vacationId,
      vacationNumber,
      vacationDate,
      empId,
      vacationTypeId,
      dateFrom,
      dateTo,
      days,
      hourFrom,
      hourTo,
      hours,
      permitLeave,
      balanceBefore,
      balanceAfter,
      user,
      approved,
      approvedBy,
      approveDate,
      notes,
      companyId,
      vacationName,
      vacationEName
    ];
  }
}
