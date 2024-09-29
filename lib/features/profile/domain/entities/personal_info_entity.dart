class PersonalInfo {
  final int? id;
  final String name;
  final String dateOfBirth;
  final String gender;
  final String email;
  final String phoneNumber;
  final String education;
  final String maritalStatus;

  // Step 2
  final String nik;
  final String address;
  final String province;
  final String city;
  final String district;
  final String village;
  final String? postalCode;
  final String? ktpImagePath;

  // Step 3
  final String? companyName;
  final String? companyAddress;
  final String? position;
  final String? workDuration;
  final String? income;
  final String? grossIncomeYearly;
  final String? bankName;
  final String? bankBranch;
  final String? accountNumber;
  final String? accountName;

  PersonalInfo({
    this.id,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.education,
    required this.maritalStatus,

    // Step 2
    required this.nik,
    required this.address,
    required this.province,
    required this.city,
    required this.district,
    required this.village,
    required this.postalCode,
    this.ktpImagePath,

    // Step 3
    this.companyName,
    this.companyAddress,
    this.position,
    this.workDuration,
    this.income,
    this.grossIncomeYearly,
    this.bankName,
    this.bankBranch,
    this.accountNumber,
    this.accountName,
  });
}
