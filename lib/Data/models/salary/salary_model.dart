import 'package:easy_hr/Domain/entity/salary/salary_data_entity.dart';

class SalaryModel extends SalaryDataEntity {
  SalaryModel({
    super.empSalId,
    super.empCode,
    super.empId,
    super.empName,
    super.empEName,
    super.dayRate,
    super.empInsur,
    super.companyInsur,
    super.workHours,
    super.monthYear,
    super.hasOver,
    super.hourRate,
    super.basicSal,
    super.socialInsurSal,
    super.workInjurSal,
    super.insurSalary,
    super.normalHours,
    super.oneHalfOverHours,
    super.oneHalfOverHoursSal,
    super.doubleOverHours,
    super.doubleOverHoursSal,
    super.awards,
    super.deductions,
    super.loans,
    super.netSalary,
    super.netSalaryRound,
    super.workInjurBalance,
    super.healthInsurance,
    super.debit,
    super.credit,
    super.holidayNum,
    super.allowances,
    super.attendDeductsV,
    super.attendDeductsD,
    super.displayFinancName,
    super.ccName,
    super.ccEName,
    super.jobName,
    super.jobEName,
    super.branchName,
    super.branchEName,
    super.paid,
    super.currName,
    super.currEName,
  });

  SalaryModel.fromJson(dynamic json) {
    empSalId = json['EmpSalId'];
    empCode = json['EmpCode'];
    empId = json['EmpId'];
    empName = json['EmpName'];
    empEName = json['EmpEName'];
    dayRate = json['DayRate'];
    empInsur = json['EmpInsur'];
    companyInsur = json['CompanyInsur'];
    workHours = json['WorkHours'];
    monthYear = json['MonthYear'];
    hasOver = json['HasOver'];
    hourRate = json['HourRate'];
    basicSal = json['BasicSal'];
    socialInsurSal = json['SocialInsurSal'];
    workInjurSal = json['WorkInjurSal'];
    insurSalary = json['InsurSalary'];
    normalHours = json['NormalHours'];
    oneHalfOverHours = json['OneHalfOverHours'];
    oneHalfOverHoursSal = json['OneHalfOverHoursSal'];
    doubleOverHours = json['DoubleOverHours'];
    doubleOverHoursSal = json['DoubleOverHoursSal'];
    awards = json['Awards'];
    deductions = json['Deductions'];
    loans = json['Loans'];
    netSalary = json['NetSalary'];
    netSalaryRound = json['NetSalaryRound'];
    workInjurBalance = json['WorkInjurBalance'];
    healthInsurance = json['HealthInsurance'];
    debit = json['Debit'];
    credit = json['Credit'];
    holidayNum = json['HolidayNum'];
    allowances = json['Allowances'];
    attendDeductsV = json['AttendDeductsV'];
    attendDeductsD = json['AttendDeductsD'];
    displayFinancName = json['DisplayFinancName'];
    ccName = json['CcName'];
    ccEName = json['CcEName'];
    jobName = json['JobName'];
    jobEName = json['JobEName'];
    branchName = json['BranchName'];
    branchEName = json['BranchEName'];
    paid = json['Paid'];
    currName = json['CurrName'];
    currEName = json['CurrEName'];
  }
}
