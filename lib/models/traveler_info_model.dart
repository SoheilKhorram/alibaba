class TravelerInfoModel {
  final String firstName;
  final String lastName;
  final int? nationalCode;
  final int? passportNumber;
  final String birthDate;
  final String gender;

  TravelerInfoModel({
    required this.firstName,
    required this.lastName,
    this.nationalCode,
    this.passportNumber,
    required this.birthDate,
    required this.gender,
  });

  String get fullName => '$firstName $lastName';
}
