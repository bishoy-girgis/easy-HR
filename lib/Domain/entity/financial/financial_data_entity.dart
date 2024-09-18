
class FinancialDataEntity {
  int? financeId;
  int? fType;
  int? fid;
  String? fName;
  String? fEName;
  String? allowPeriod;
  double? amountVal;
  String? calcDate;
  bool? manualPaid;
  bool? postAcc;
  bool? approved;

  FinancialDataEntity({
      this.financeId, 
      this.fType, 
      this.fid, 
      this.fName, 
      this.fEName, 
      this.allowPeriod, 
      this.amountVal, 
      this.calcDate, 
      this.manualPaid, 
      this.postAcc, 
      this.approved,});

  FinancialDataEntity.fromJson(dynamic json) {
    financeId = json['FinanceId'];
    fType = json['FType'];
    fid = json['Fid'];
    fName = json['FName'];
    fEName = json['FEName'];
    allowPeriod = json['AllowPeriod'];
    amountVal = json['AmountVal'];
    calcDate = json['CalcDate'];
    manualPaid = json['ManualPaid'];
    postAcc = json['PostAcc'];
    approved = json['Approved'];
  }


}