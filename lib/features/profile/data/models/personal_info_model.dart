class PersonalInfoModel {
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

  PersonalInfoModel({
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
    this.postalCode,
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

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'email': email,
        'phoneNumber': phoneNumber,
        'education': education,
        'maritalStatus': maritalStatus,

        // Step 2
        'nik': nik,
        'address': address,
        'province': province,
        'city': city,
        'district': district,
        'village': village,
        'postalCode': postalCode,
        'ktpImagePath': ktpImagePath,

        // Step 3
        'companyName': companyName,
        'companyAddress': companyAddress,
        'position': position,
        'workDuration': workDuration,
        'income': income,
        'grossIncomeYearly': grossIncomeYearly,
        'bankName': bankName,
        'bankBranch': bankBranch,
        'accountNumber': accountNumber,
        'accountName': accountName,
      };

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) =>
      PersonalInfoModel(
        id: json['id'],
        name: json['name'],
        dateOfBirth: json['dateOfBirth'],
        gender: json['gender'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        education: json['education'],
        maritalStatus: json['maritalStatus'],

        // Step 2
        nik: json['nik'],
        address: json['address'],
        province: json['province'],
        city: json['city'],
        district: json['district'],
        village: json['village'],
        postalCode: json['postalCode'],
        ktpImagePath: json['ktpImagePath'],

        // Step 3
        companyName: json['companyName'],
        companyAddress: json['companyAddress'],
        position: json['position'],
        workDuration: json['workDuration'],
        income: json['income'],
        grossIncomeYearly: json['grossIncomeYearly'],
        bankName: json['bankName'],
        bankBranch: json['bankBranch'],
        accountNumber: json['accountNumber'],
      );
}
