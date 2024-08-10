import 'package:equatable/equatable.dart';

class ProfileDataEntity extends Equatable {
  ProfileDataEntity({
      this.empcode, 
      this.empname, 
      this.empename, 
      this.educationname, 
      this.educationename, 
      this.birthdate, 
      this.email, 
      this.nationname, 
      this.nationename, 
      this.address, 
      this.eaddress, 
      this.id, 
      this.basicsalary, 
      this.empBank, 
      this.paymenttype, 
      this.balancearda, 
      this.balancenormal, 
      this.normalworkhoursfrom, 
      this.normalworkhoursto, 
      this.weekendworkhoursfrom, 
      this.weekendworkhoursto, 
      this.joindate, 
      this.contractdate, 
      this.jobname, 
      this.jobename,
  this.empMobile,
    });

  int? empcode;
  String? empname;
  String? empename;
  String? educationname;
  String? educationename;
  String? birthdate;
  String? email;
  String? nationname;
  String? nationename;
  String? address;
  String? eaddress;
  String? id;
  double? basicsalary;
  String? empBank;
  String? paymenttype;
  int? balancearda;
  int? balancenormal;
  String? normalworkhoursfrom;
  String? normalworkhoursto;
  String? weekendworkhoursfrom;
  String? weekendworkhoursto;
  String? joindate;
  String? contractdate;
  String? jobname;
  String? jobename;
  String? empMobile;

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      empcode,
      empname,
      empename,
      educationname,
      educationename,
      birthdate,
      email,
      nationname,
      nationename,
      address,
      eaddress,
      id,
      basicsalary,
      empBank,
      paymenttype,
      balancearda,
      balancenormal,
      normalworkhoursfrom,
      normalworkhoursto,
      weekendworkhoursfrom,
      weekendworkhoursto,
      joindate,
      contractdate,
      jobname,
      jobename,
      empMobile,
    ];
  }

}