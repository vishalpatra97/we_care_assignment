enum AppRoleEnum {
  patient,
  doctor;

  bool get isPatient => this == AppRoleEnum.patient;
  bool get isDoctor => this == AppRoleEnum.doctor;
}
