import 'package:equatable/equatable.dart';

class SalaryDataEntity extends Equatable {
  int? empSalId;
  int? empCode;
  int? empId;
  String? empName;
  String? empEName;
  double? dayRate;
  int? empInsur;
  int? companyInsur;
  double? workHours;
  String? monthYear;
  bool? hasOver;
  double? hourRate;
  double? basicSal;
  double? socialInsurSal;
  double? workInjurSal;
  double? insurSalary;
  double? normalHours;
  double? oneHalfOverHours;
  double? oneHalfOverHoursSal;
  double? doubleOverHours;
  double? doubleOverHoursSal;
  double? awards;
  double? deductions;
  double? loans;
  double? netSalary;
  int? netSalaryRound;
  double? workInjurBalance;
  double? healthInsurance;
  double? debit;
  double? credit;
  int? holidayNum;
  double? allowances;
  double? attendDeductsV;
  double? attendDeductsD;
  String? displayFinancName;
  String? ccName;
  String? ccEName;
  String? jobName;
  String? jobEName;
  String? branchName;
  String? branchEName;
  bool? paid;
  String? currName;
  String? currEName;

  SalaryDataEntity({
    this.empSalId,
    this.empCode,
    this.empId,
    this.empName,
    this.empEName,
    this.dayRate,
    this.empInsur,
    this.companyInsur,
    this.workHours,
    this.monthYear,
    this.hasOver,
    this.hourRate,
    this.basicSal,
    this.socialInsurSal,
    this.workInjurSal,
    this.insurSalary,
    this.normalHours,
    this.oneHalfOverHours,
    this.oneHalfOverHoursSal,
    this.doubleOverHours,
    this.doubleOverHoursSal,
    this.awards,
    this.deductions,
    this.loans,
    this.netSalary,
    this.netSalaryRound,
    this.workInjurBalance,
    this.healthInsurance,
    this.debit,
    this.credit,
    this.holidayNum,
    this.allowances,
    this.attendDeductsV,
    this.attendDeductsD,
    this.displayFinancName,
    this.ccName,
    this.ccEName,
    this.jobName,
    this.jobEName,
    this.branchName,
    this.branchEName,
    this.paid,
    this.currName,
    this.currEName,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return <Object?>[
      empSalId,
      empCode,
      empId,
      empName,
      empEName,
      dayRate,
      empInsur,
      companyInsur,
      workHours,
      monthYear,
      hasOver,
      hourRate,
      basicSal,
      socialInsurSal,
      workInjurSal,
      insurSalary,
      normalHours,
      oneHalfOverHours,
      oneHalfOverHoursSal,
      doubleOverHours,
      doubleOverHoursSal,
      awards,
      deductions,
      loans,
      netSalary,
      netSalaryRound,
      workInjurBalance,
      healthInsurance,
      debit,
      credit,
      holidayNum,
      allowances,
      attendDeductsV,
      attendDeductsD,
      displayFinancName,
      ccName,
      ccEName,
      jobName,
      jobEName,
      branchName,
      branchEName,
      paid,
      currName,
      currEName,
    ];
  }
}
