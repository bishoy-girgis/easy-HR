import 'package:easy_hr/Domain/entity/vacation/vacation_data_entity.dart';

class VacationModel extends VacationDataEntity {
  VacationModel({
    super.vacationId,
    super.vacationNumber,
    super.vacationDate,
    super.empId,
    super.vacationTypeId,
    super.dateFrom,
    super.dateTo,
    super.days,
    super.hourFrom,
    super.hourTo,
    super.hours,
    super.permitLeave,
    super.balanceBefore,
    super.balanceAfter,
    super.user,
    super.approved,
    super.approvedBy,
    super.approveDate,
    super.notes,
    super.companyId,
    super.VacationName,
    super.VacationEName,
  });

  VacationModel.fromJson(dynamic json) {
    vacationId = json['VacationId'];
    vacationNumber = json['VacationNumber'];
    vacationDate = json['VacationDate'];
    empId = json['EmpId'];
    vacationTypeId = json['VacationTypeId'];
    dateFrom = json['DateFrom'];
    dateTo = json['DateTo'];
    days = json['Days'];
    hourFrom = json['HourFrom'];
    hourTo = json['HourTo'];
    hours = json['Hours'];
    permitLeave = json['PermitLeave'];
    balanceBefore = json['BalanceBefore'];
    balanceAfter = json['BalanceAfter'];
    user = json['User'];
    approved = json['Approved'];
    approvedBy = json['ApprovedBy'];
    approveDate = json['ApproveDate'];
    notes = json['Notes'];
    companyId = json['CompanyId'];
    VacationName = json['VacationName'];
    VacationEName = json['VacationEName'];
  }

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['VacationId'] = vacationId;
  //   map['VacationNumber'] = vacationNumber;
  //   map['VacationDate'] = vacationDate;
  //   map['EmpId'] = empId;
  //   map['VacationTypeId'] = vacationTypeId;
  //   map['DateFrom'] = dateFrom;
  //   map['DateTo'] = dateTo;
  //   map['Days'] = days;
  //   map['HourFrom'] = hourFrom;
  //   map['HourTo'] = hourTo;
  //   map['Hours'] = hours;
  //   map['PermitLeave'] = permitLeave;
  //   map['BalanceBefore'] = balanceBefore;
  //   map['BalanceAfter'] = balanceAfter;
  //   map['User'] = user;
  //   map['Approved'] = approved;
  //   map['ApprovedBy'] = approvedBy;
  //   map['ApproveDate'] = approveDate;
  //   map['Notes'] = notes;
  //   map['CompanyId'] = companyId;
  //   return map;
  // }
}
