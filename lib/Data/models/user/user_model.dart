
import '../../../Domain/entity/user/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.accessToken,
    super.tokenType,
    super.expiresIn,
    super.userName,
    super.branchId,
    super.whId,
    super.ccId,
    super.discP,
    super.empId,
    super.companyId,
    super.vatType,
    super.vat,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json['access_token'] as String?,
        tokenType: json['token_type'] as String?,
        expiresIn: json['expires_in'] as int?,
        userName: json['UserName'] as String?,
        branchId: json['BranchId'] as int?,
        whId: json['whId'] as int?,
        ccId: json['CCId'] as int?,
        discP: json['DiscP'] as double?,
        empId: json['EmpId'] as int?,
        companyId: json['CompanyId'] as int?,
        vatType: json['VATType'] as int?,
        vat: json['VAT'] as double?,
      );
}
