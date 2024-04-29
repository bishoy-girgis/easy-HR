import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? userName;
  final int? branchId;
  final int? whId;
  final int? ccId;
  final double? discP;
  final int? empId;
  final int? companyId;
  final int? vatType;
  final double? vat;

  const UserEntity({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.userName,
    this.branchId,
    this.whId,
    this.ccId,
    this.discP,
    this.empId,
    this.companyId,
    this.vatType,
    this.vat,
  });

  @override
  List<Object?> get props {
    return [
      accessToken,
      tokenType,
      expiresIn,
      userName,
      branchId,
      whId,
      ccId,
      discP,
      empId,
      companyId,
      vatType,
      vat,
    ];
  }
}
