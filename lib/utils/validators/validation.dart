
class TValidator {

  /// empty text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama wajib diisi';
    }
    return null;
  }
  static String? validateEmail(String? value) {
    if( value == null || value.isEmpty) {
      return 'Email wajib diisi';
    }

    // regex for email validation
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Alamat email tidak valid';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if( value == null || value.isEmpty) {
      return 'Kata sandi wajib diisi';
    }

    //check for minimum password length
    if(value.length < 6) {
      return 'Kata sandi minimal 6 karakter';
    }

    //check for uppercase letter
    if(!value.contains(RegExp(r'[A-Z]'))) {
      return 'Kata sandi harus memiliki satu huruf besar';
    }
    
    //check for numbers
    if(!value.contains(RegExp(r'[0-9]'))) {
      return 'Kata sandi harus memiliki satu angka';
    }

    //check for special characters
    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Kata sandi harus memiliki satu karakter khusus';
    }

    return null;

  }

  static String? validatePhoneNumber(String? value) {
    if( value == null || value.isEmpty) {
      return 'Nomor telepon wajib diisi';
    }

    //regex for phone number validation (assuming 10-digit us number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Nomor telepon harus 10 digit';
    }

    return null;
  }

  static String? validateGeneral(String? value) {
    if( value == null || value.isEmpty) {
      return 'Tidak boleh kosong';
    }
    return null;
  }

  static String? validateAgeWithYears(String? value) {
    if (value == null || value.isEmpty) {
      return 'Usia tidak boleh kosong';
    }

    if (!value.endsWith("tahun")) {
      return 'Usia harus diikuti dengan "tahun"';
    }

    String ageString = value.replaceAll("tahun", "").trim();
    final age = int.tryParse(ageString);

    if (age == null || age <= 0) {
      return 'Usia harus berupa angka yang valid';
    }

    return null;
  }
  static String? validateDurationWithUnit(String? value) {
    if (value == null || value.isEmpty) {
      return 'Durasi tidak boleh kosong';
    }

    if (!(value.endsWith("tahun") || value.endsWith("bulan") || value.endsWith("hari"))) {
      return 'Durasi harus diikuti dengan "hari", "bulan", atau "tahun"';
    }

    String numberString = value.replaceAll(RegExp(r'(tahun|bulan|hari)'), '').trim();
    final number = int.tryParse(numberString);

    if (number == null || number <= 0) {
      return 'Durasi harus berupa angka yang valid';
    }

    return null;
  }


// add more custom validations as required for your specific requirements
}