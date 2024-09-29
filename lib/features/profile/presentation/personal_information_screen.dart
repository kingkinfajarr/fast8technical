import 'dart:io';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../cores/constants/app_color.dart';
import '../../../cores/widgets/date_picker.dart';
import '../../../cores/widgets/dropdown_field.dart';
import '../../../cores/widgets/input_field.dart';
import '../../../cores/widgets/main_button.dart';
import '../../../cores/widgets/secondary_button.dart';
import '../domain/entities/personal_info_entity.dart';
import 'blocs/personal_info/personal_info_bloc.dart';
import 'main_profile_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  int _index = 0;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _educationController = TextEditingController();
  final _maritalStatusController = TextEditingController();

  //step 2
  final _nikController = TextEditingController();
  final _addressController = TextEditingController();
  final _provinceController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _villageController = TextEditingController();
  final _postalCodeController = TextEditingController();
  File? _ktpImage;

  //step 3
  final _companyNameController = TextEditingController();
  final _companyAddressController = TextEditingController();
  final _positionController = TextEditingController();
  final _workDurationController = TextEditingController();
  final _incomeController = TextEditingController();
  final _grossIncomeYearlyController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _bankBranchController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _accountNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<PersonalInfoBloc>().add(GetPersonalInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonalInfoBloc, PersonalInfoState>(
      listener: (context, state) {
        if (state is PersonalInfoSuccess) {
          _populateFields(state.info);
        }

        if (state is PersonalInfoError) {
          print(state.message);
        }

        if (state is SavePersonalInfoSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: const Text("Data berhasil tersimpan"),
              duration: const Duration(seconds: 1),
              backgroundColor: clrGreen,
            ),
          );

          context.read<PersonalInfoBloc>().add(GetPersonalInfoEvent());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Informasi Pribadi'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            EasyStepper(
              activeStep: _index,
              lineStyle: LineStyle(
                lineType: LineType.normal,
                defaultLineColor: clrYellow.withOpacity(0.3),
                activeLineColor: clrYellow.withOpacity(0.3),
                lineLength: 95,
                lineThickness: 3,
                finishedLineColor: clrYellow,
                progress: 0.5,
                progressColor: clrYellow,
              ),
              direction: Axis.horizontal,
              activeStepTextColor: clrYellow,
              finishedStepTextColor: clrYellow,
              internalPadding: 0,
              showLoadingAnimation: false,
              stepRadius: 20,
              showStepBorder: false,
              steps: [
                EasyStep(
                  customTitle: Text(
                    'Biodata Diri',
                    style: TextStyle(color: clrYellow),
                    textAlign: TextAlign.center,
                  ),
                  customStep: _buildCustomStep(0),
                ),
                EasyStep(
                  customTitle: Text(
                    'Alamat\nPribadi',
                    style: TextStyle(color: clrYellow),
                    textAlign: TextAlign.center,
                  ),
                  customStep: _buildCustomStep(1),
                ),
                EasyStep(
                  customTitle: Text(
                    'Informasi\nPerusahaan',
                    style: TextStyle(color: clrYellow),
                    textAlign: TextAlign.center,
                  ),
                  customStep: _buildCustomStep(2),
                ),
              ],
              onStepReached: (index) {
                setState(() {
                  _index = index;
                });
              },
            ),
            Expanded(
              child: BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
                builder: (context, state) {
                  if (state is PersonalInfoSuccess) {
                    _populateFields(state.info);
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(key: _formKey, child: _buildForm()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomStep(int step) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: _index >= step ? clrYellow : clrYellow.withOpacity(0.35),
      child: Text(
        '${step + 1}',
        style: TextStyle(color: clrWhite),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_index == 0) ...[
          CustomInputField(
            controller: _nameController,
            label: 'NAMA LENGKAP',
            onChanged: (newvalue) {},
          ),
          CustomDatePickerField(
            label: 'TANGGAL LAHIR',
            initialDate: _dobController.text.isNotEmpty
                ? DateTime.parse(_dobController.text)
                : DateTime.now(),
            onChanged: (value) {
              setState(() {
                _dobController.text = value.toString().split(' ')[0];
              });
            },
          ),
          CustomDropdownField(
            label: 'JENIS KELAMIN',
            value: _genderController.text.isNotEmpty
                ? _genderController.text
                : null,
            items: const ['Laki-laki', 'Perempuan'],
            onChanged: (String? newValue) {
              setState(() {
                _genderController.text = newValue ?? '';
              });
            },
          ),
          CustomInputField(
            controller: _emailController,
            label: 'ALAMAT EMAIL',
            onChanged: (newValue) {},
            keyboardType: TextInputType.emailAddress,
          ),
          CustomInputField(
            controller: _phoneController,
            label: 'NO. HP',
            onChanged: (newValue) {},
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(13),
            ],
          ),
          CustomDropdownField(
            label: 'PENDIDIKAN',
            value: _educationController.text.isNotEmpty
                ? _educationController.text
                : null,
            items: const [
              'SD',
              'SMP',
              'SMA',
              'D1',
              'D2',
              'D3',
              'S1',
              'S2',
              'S3'
            ],
            onChanged: (String? newValue) {
              setState(() {
                _educationController.text = newValue ?? '';
              });
            },
          ),
          CustomDropdownField(
            label: 'STATUS PERNIKAHAN',
            value: _maritalStatusController.text.isNotEmpty
                ? _maritalStatusController.text
                : null,
            items: const ['Belum Kawin', 'Kawin', 'Janda', 'Duda'],
            onChanged: (String? newValue) {
              setState(() {
                _maritalStatusController.text = newValue ?? '';
              });
            },
          ),
          MainButton(
              title: 'Selanjutnya',
              onPressed: () {
                _savePersonalInfo();
              })
        ] else if (_index == 1) ...[
          _buildKtpUpload(),
          const SizedBox(height: 20),
          CustomInputField(
            label: 'NIK',
            controller: _nikController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
            ],
          ),
          CustomInputField(
            label: 'ALAMAT SESUAI KTP',
            controller: _addressController,
          ),
          CustomInputField(
            label: 'PROVINSI',
            controller: _provinceController,
          ),
          CustomInputField(
            label: 'KOTA/KABUPATEN',
            controller: _cityController,
          ),
          CustomInputField(
            label: 'KECAMATAN',
            controller: _districtController,
          ),
          CustomInputField(
            label: 'KELURAHAN',
            controller: _villageController,
          ),
          CustomInputField(
            label: 'KODE POS',
            controller: _postalCodeController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(5),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  title: 'Sebelumnya',
                  onPressed: () {
                    setState(() {
                      _index -= 1;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MainButton(
                  title: 'Selanjutnya',
                  onPressed: () {
                    _savePersonalInfo();
                  },
                ),
              ),
            ],
          ),
        ] else if (_index == 2) ...[
          CustomInputField(
            label: 'NAMA PERUSAHAAN',
            controller: _companyNameController,
            onChanged: (value) {},
          ),
          CustomInputField(
            label: 'ALAMAT PERUSAHAAN',
            controller: _companyAddressController,
            onChanged: (value) {},
          ),
          CustomDropdownField(
            label: 'JABATAN',
            value: _positionController.text.isNotEmpty
                ? _positionController.text
                : null,
            items: const [
              'Non-Staff',
              'Staf',
              'Supervisor',
              'Manajer',
              'Direktur',
              'Lainnya'
            ],
            onChanged: (String? newValue) {
              _positionController.text = newValue!;
            },
            // required: false,
          ),
          CustomDropdownField(
            label: 'LAMA BEKERJA',
            value: _workDurationController.text.isNotEmpty
                ? _workDurationController.text
                : null,
            items: const [
              '< 6 Bulan',
              '6 Bulan - 1 Tahun',
              '1 - 2 Tahun',
              '> 2 Tahun',
            ],
            onChanged: (String? newValue) {
              _workDurationController.text = newValue ?? '';
            },
            // required: false,
          ),
          CustomDropdownField(
            label: 'SUMBER PENDAPATAN',
            value: _incomeController.text.isNotEmpty
                ? _incomeController.text
                : null,
            items: const [
              'Gaji',
              'Keuntungan Bisnis',
              'Bunga Tabungan',
              'Warisan',
              'Dana dari orang tua atau anak',
              'Undian',
              'Keuntungan Investasi',
              'Lainnya',
            ],
            onChanged: (String? newValue) {
              _incomeController.text = newValue ?? '';
            },
            required: false,
          ),
          CustomDropdownField(
            label: 'PENDAPATAN KOTOR PERTAHUN',
            value: _grossIncomeYearlyController.text.isNotEmpty
                ? _grossIncomeYearlyController.text
                : null,
            items: const [
              '< 10 Juta',
              '10 - 50 Juta',
              '50 - 100 Juta',
              '100 - 500 Juta',
              '500 Juta - 1 Miliar',
              '> 1 Miliar',
            ],
            onChanged: (String? newValue) {
              _grossIncomeYearlyController.text = newValue ?? '';
            },
            required: false,
          ),
          CustomInputField(
            label: 'NAMA BANK',
            controller: _bankNameController,
          ),
          CustomInputField(
            label: 'CABANG BANK',
            controller: _bankBranchController,
          ),
          CustomInputField(
            label: 'NOMOR REKENING',
            controller: _accountNumberController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          CustomInputField(
            label: 'NAMA PEMILIK REKENING',
            controller: _accountNameController,
            onChanged: (value) {},
          ),
          Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  title: 'Sebelumnya',
                  onPressed: () {
                    setState(() {
                      _index -= 1;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MainButton(
                  title: 'Simpan',
                  onPressed: () {
                    _savePersonalInfo();
                  },
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  void _populateFields(PersonalInfo info) {
    _nameController.text = info.name;
    _dobController.text = info.dateOfBirth;
    _genderController.text = info.gender;
    _emailController.text = info.email;
    _phoneController.text = info.phoneNumber;
    _educationController.text = info.education;
    _maritalStatusController.text = info.maritalStatus;

    // Populate step 2 fields
    _nikController.text = info.nik;
    _addressController.text = info.address;
    _provinceController.text = info.province;
    _cityController.text = info.city;
    _districtController.text = info.district;
    _villageController.text = info.village;
    _postalCodeController.text = info.postalCode ?? '';

    // Populate step 3 fields
    _companyNameController.text = info.companyName ?? '';
    _companyAddressController.text = info.companyAddress ?? '';
    _positionController.text = info.position ?? '';
    _workDurationController.text = info.workDuration ?? '';
    _incomeController.text = info.income ?? '';
    _grossIncomeYearlyController.text = info.grossIncomeYearly ?? '';
    _bankNameController.text = info.bankName ?? '';
    _bankBranchController.text = info.bankBranch ?? '';
    _accountNumberController.text = info.accountNumber ?? '';
    _accountNameController.text = info.accountName ?? '';
  }

  Future<void> _savePersonalInfo() async {
    if (_formKey.currentState!.validate()) {
      final directory = await getApplicationDocumentsDirectory();
      String? ktpPath;
      if (_ktpImage != null) {
        final String path = directory.path;
        final String fileName =
            'ktp_image_${DateTime.now().millisecondsSinceEpoch}.png';
        final String filePath = '$path/$fileName';
        await _ktpImage!.copy(filePath);
        ktpPath = filePath;
      }

      final info = PersonalInfo(
        id: 1,
        name: _nameController.text,
        dateOfBirth: _dobController.text,
        gender: _genderController.text,
        email: _emailController.text,
        phoneNumber: _phoneController.text,
        education: _educationController.text,
        maritalStatus: _maritalStatusController.text,

        //step 2
        nik: _nikController.text,
        address: _addressController.text,
        province: _provinceController.text,
        city: _cityController.text,
        district: _districtController.text,
        village: _villageController.text,
        postalCode: _postalCodeController.text,
        ktpImagePath: ktpPath,

        //step 3
        companyName: _companyNameController.text,
        companyAddress: _companyAddressController.text,
        position: _positionController.text,
        workDuration: _workDurationController.text,
        income: _incomeController.text,
        grossIncomeYearly: _grossIncomeYearlyController.text,
        bankName: _bankNameController.text,
        bankBranch: _bankBranchController.text,
        accountNumber: _accountNumberController.text,
        accountName: _accountNameController.text,
      );
      // ignore: use_build_context_synchronously
      context.read<PersonalInfoBloc>().add(SavePersonalInfoEvent(info));

      if (_index == 0) {
        setState(() {
          _index += 1;
        });
      } else if (_index == 1) {
        setState(() {
          _index += 1;
        });
      } else {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const MainProfileScreen(),
          ),
        );
      }
    }
  }

  Widget _buildKtpUpload() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.upload_file, color: Colors.amber),
            const SizedBox(width: 16),
            const Text('Upload KTP'),
            const Spacer(),
            if (_ktpImage != null)
              const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await showDialog<XFile>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Choose Image Source'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context,
                    await _picker.pickImage(source: ImageSource.camera));
              },
              child: const Text('Camera'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context,
                    await _picker.pickImage(source: ImageSource.gallery));
              },
              child: const Text('Gallery'),
            ),
          ],
        );
      },
    );

    if (image != null) {
      setState(() {
        _ktpImage = File(image.path);
      });
    }
  }
}
