import 'package:easy_hr/Domain/entity/vacation/vacation_type_entity.dart';

class VacationTypeModel extends VacationTypeEntity {
  VacationTypeModel({
    super.vacationTypeId,
    super.vacationTypet,
    super.vacationTypeName,
    super.vacationTypeEName,
  });

  VacationTypeModel.fromJson(dynamic json) {
    vacationTypeId = json['VacationTypeId'];
    vacationTypet = json['VacationTypet'];
    vacationTypeName = json['VacationTypeName'];
    vacationTypeEName = json['VacationTypeEName'];
  }

}
