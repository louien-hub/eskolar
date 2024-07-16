import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Skolar',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String _lastName = '', _firstName = '', _middleName = '', _extensionName = '';
  String _address = '', _municipality = '', _contactNumber = '';
  DateTime? _dateOfBirth;
  String _dateOfBirthString = '', _gender = '', _age = '';
  String _civilStatus = '', _gcashNumber = '', _courseProgram = '';
  String _yearLevel = '', _semester = '', _academicYear = '';

  String _beneficiaryLastName = '', _beneficiaryFirstName = '', _beneficiaryMiddleName = '', _beneficiaryExtensionName = '';
  String _beneficiaryAddress = '', _beneficiaryMunicipality = '', _beneficiaryContactNumber = '';
  DateTime? _beneficiaryDateOfBirth;
  String _beneficiaryDateOfBirthString = '', _beneficiaryGender = '', _beneficiaryAge = '';
  String _beneficiaryCivilStatus = '', _beneficiaryGcashNumber = '';

  final List<String> _municipalities = ['Bauan', 'Lobo', 'Mabini', 'San Luis', 'San Pascual', 'Tingloy'];
  final List<String> _genders = ['Male', 'Female'];  
  bool _beneficiaryCheckedSelf = false;
  bool _beneficiaryCheckedRelative = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Skolar')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildSectionTitle('REPRESENTATIVE IDENTIFYING INFORMATION:'),
                _buildTextField('Last Name', (value) => _lastName = value!),
                _buildTextField('First Name', (value) => _firstName = value!),
                _buildTextField('Middle Name', (value) => _middleName = value!),
                _buildTextField('Extension Name', (value) => _extensionName = value!, isOptional: true),
                _buildTextField('Address', (value) => _address = value!),
                _buildDropdown('Municipality', _municipalities, _municipality, (value) => _municipality = value!),
                _buildTextField('Contact No.', (value) => _contactNumber = value!),
                _buildDateField(context, (pickedDate) {
                  _dateOfBirth = pickedDate;
                  _dateOfBirthString = DateFormat('dd/MM/yyyy').format(pickedDate);
                  _age = _calculateAge(pickedDate);
                }, _dateOfBirthString),
                _buildTextField('Age', (value) => _age = value!, enabled: true, initialValue: _age),
                _buildDropdown('Gender', _genders, _gender, (value) => _gender = value!),
                _buildTextField('Civil Status', (value) => _civilStatus = value!),
                _buildTextField('GCash No.', (value) => _gcashNumber = value!),
                _buildTextField('Course/Program', (value) => _courseProgram = value!),
                _buildTextField('Year Level', (value) => _yearLevel = value!),
                _buildTextField('Semester', (value) => _semester = value!),
                _buildTextField('Academic Year', (value) => _academicYear = value!),
                _buildSectionTitle(
                  'BENEFICIARY IDENTIFYING INFORMATION:',
                  trailing: Row(
                    children: [
                      Checkbox(
                        value: _beneficiaryCheckedSelf,
                        onChanged: (bool? value) {
                          setState(() {
                            _beneficiaryCheckedSelf = value ?? false;
                            _beneficiaryCheckedRelative = !_beneficiaryCheckedSelf;
                          });
                        },
                      ),
                      Text('Self'),
                      SizedBox(width: 10),
                      Checkbox(
                        value: _beneficiaryCheckedRelative,
                        onChanged: (bool? value) {
                          setState(() {
                            _beneficiaryCheckedRelative = value ?? false;
                            _beneficiaryCheckedSelf = !_beneficiaryCheckedRelative;
                          });
                        },
                      ),
                      Text('Relative'),
                    ],
                  ),
                ),
                _buildTextField('Last Name', (value) => _beneficiaryLastName = value!),
                _buildTextField('First Name', (value) => _beneficiaryFirstName = value!),
                _buildTextField('Middle Name', (value) => _beneficiaryMiddleName = value!),
                _buildTextField('Extension Name', (value) => _beneficiaryExtensionName = value!, isOptional: true),
                _buildTextField('Address', (value) => _beneficiaryAddress = value!),
                _buildDropdown('Municipality', _municipalities, _beneficiaryMunicipality, (value) => _beneficiaryMunicipality = value!),
                _buildTextField('Contact No.', (value) => _beneficiaryContactNumber = value!),
                _buildDateField(context, (pickedDate) {
                  _beneficiaryDateOfBirth = pickedDate;
                  _beneficiaryDateOfBirthString = DateFormat('dd/MM/yyyy').format(pickedDate);
                  _beneficiaryAge = _calculateAge(pickedDate);
                }, _beneficiaryDateOfBirthString),
                _buildTextField('Age', (value) => _beneficiaryAge = value!, enabled: true, initialValue: _beneficiaryAge),
                _buildDropdown('Gender', _genders, _beneficiaryGender, (value) => _beneficiaryGender = value!),
                _buildTextField('Civil Status', (value) => _beneficiaryCivilStatus = value!),
                _buildTextField('GCash No.', (value) => _beneficiaryGcashNumber = value!),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _printFormData();
                    }
                  },
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {Widget? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _buildTextField(String label, Function(String?) onSave, {bool enabled = true, String initialValue = '', bool isOptional = false}) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
          validator: (value) => isOptional || (value != null && value.isNotEmpty) ? null : 'Please enter your $label.',
          onSaved: onSave,
          enabled: enabled,
          initialValue: initialValue,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedItem, Function(String?) onChanged) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
          value: selectedItem.isNotEmpty ? selectedItem : null,
          items: items.map((String item) => DropdownMenuItem<String>(value: item, child: Text(item))).toList(),
          onChanged: (value) => setState(() => onChanged(value)),
          validator: (value) => value == null || value.isEmpty ? 'Please select your $label' : null,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDateField(BuildContext context, Function(DateTime) onDateSelected, String dateString) {
    return Column(
      children: [
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Date of Birth (dd/MM/yyyy)', 
            border: OutlineInputBorder()
          ),
          onTap: () => _selectDate(context, onDateSelected),
          controller: TextEditingController(text: dateString),
          validator: (value) => dateString.isEmpty ? 'Please enter your date of birth.' : null,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  void _selectDate(BuildContext context, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        onDateSelected(picked);
      });
    }
  }

  String _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }
    return age.toString();
  }

  void _printFormData() {
    print('Last Name: $_lastName');
    print('First Name: $_firstName');
    print('Middle Name: $_middleName');
    print('Extension Name: $_extensionName');
    print('Address: $_address');
    print('Municipality: $_municipality');
    print('Contact Number: $_contactNumber');
    if (_dateOfBirth != null) {
      print('Date of Birth: ${DateFormat('dd/MM/yyyy').format(_dateOfBirth!)}');
      print('Age: $_age');
    }
    print('Gender: $_gender');
    print('Civil Status: $_civilStatus');
    print('GCash Number: $_gcashNumber');
    print('Course/Program: $_courseProgram');
    print('Year Level: $_yearLevel');
    print('Semester: $_semester');
    print('Academic Year: $_academicYear');

    print('Last Name: $_beneficiaryLastName');
    print('irst Name: $_beneficiaryFirstName');
    print('Middle Name: $_beneficiaryMiddleName');
    print('Extension Name: $_beneficiaryExtensionName');
    print('Address: $_beneficiaryAddress');
    print('Municipality: $_beneficiaryMunicipality');
    print('Contact Number: $_beneficiaryContactNumber');
    if (_beneficiaryDateOfBirth != null) {
      print('Date of Birth: ${DateFormat('dd/MM/yyyy').format(_beneficiaryDateOfBirth!)}');
      print('Age: $_beneficiaryAge');
    }
    print('Gender: $_beneficiaryGender');
    print('Civil Status: $_beneficiaryCivilStatus');
    print('GCash Number: $_beneficiaryGcashNumber');
  }
  
  DateFormat(String s) {}
}
