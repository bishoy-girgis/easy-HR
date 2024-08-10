
import '../../../Domain/entity/profile/profile_data_entity.dart';

class ProfileModel extends ProfileDataEntity {
  ProfileModel({
    super.empcode,
    super.empname,
    super.empename,
    super.educationname,
    super.educationename,
    super.birthdate,
    super.email,
    super.nationname,
    super.nationename,
    super.address,
    super.eaddress,
    super.id,
    super.basicsalary,
    super.empBank,
    super.paymenttype,
    super.balancearda,
    super.balancenormal,
    super.normalworkhoursfrom,
    super.normalworkhoursto,
    super.weekendworkhoursfrom,
    super.weekendworkhoursto,
    super.joindate,
    super.contractdate,
    super.jobname,
    super.jobename,
    super.empMobile,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        empcode: json['empcode'],
        empname: json['empname'],
        empename: json['empename'],
        educationname: json['educationname'],
        educationename: json['educationename'],
        birthdate: json['birthdate'],
        email: json['email'],
        nationname: json['nationname'],
        nationename: json['nationename'],
        address: json['address'],
        eaddress: json['eaddress'],
        id: json['id'],
        basicsalary: json['basicsalary'],
        empBank: json['EmpBank'],
        paymenttype: json['paymenttype'],
        balancearda: json['balancearda'],
        balancenormal: json['balancenormal'],
        normalworkhoursfrom: json['normalworkhoursfrom'],
        normalworkhoursto: json['normalworkhoursto'],
        weekendworkhoursfrom: json['weekendworkhoursfrom'],
        weekendworkhoursto: json['weekendworkhoursto'],
        joindate: json['joindate'],
        contractdate: json['contractdate'],
        jobname: json['jobname'],
        jobename: json['jobename'],
    empMobile: json['empMobile'],
      );
}
