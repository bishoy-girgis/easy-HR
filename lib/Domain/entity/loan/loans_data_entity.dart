
class LoanDataEntity {
  LoanDataEntity({
      this.loanNumber, 
      this.loanDate, 
      this.loanValue, 
      this.balance, 
      this.salaryDeduct, 
      this.paid,});

  LoanDataEntity.fromJson(dynamic json) {
    loanNumber = json['LoanNumber'];
    loanDate = json['LoanDate'];
    loanValue = json['LoanValue'];
    balance = json['Balance'];
    salaryDeduct = json['SalaryDeduct'];
    paid = json['Paid'];
  }
  int? loanNumber;
  String? loanDate;
  double? loanValue;
  double? balance;
  bool? salaryDeduct;
  double? paid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['LoanNumber'] = loanNumber;
    map['LoanDate'] = loanDate;
    map['LoanValue'] = loanValue;
    map['Balance'] = balance;
    map['SalaryDeduct'] = salaryDeduct;
    map['Paid'] = paid;
    return map;
  }

}