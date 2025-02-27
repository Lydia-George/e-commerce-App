import 'package:intl/intl.dart';
class TFormatter{
  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); //customize the date formate as needed
  }
  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: "EGP", symbol: 'L.E').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber){

    // assuming a 11 digit EG phone number format : (0122) 456-7890
    if (phoneNumber.length==10){
      return "(${phoneNumber.substring(1,4)}) ${phoneNumber.substring(4,6)} ${phoneNumber.substring(6)}";
    }
    return phoneNumber;
  }
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digits only
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2); // Get remaining digits after country code

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) '); // Add country code to formatted number

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2; // Default group length
      if (i == 0 && countryCode == '+20') {
        groupLength = 3; // First group length for Egypt
      }
      int end = i + groupLength;

      // Ensure we don't exceed the string length
      if (end > digitsOnly.length) {
        end = digitsOnly.length;
      }

      formattedNumber.write(digitsOnly.substring(i, end)); // Add the group to the formatted number

      if (end < digitsOnly.length) {
        formattedNumber.write(' '); // Add space if there are more digits
      }
      i = end; // Move to the next group
    }

    // Return the fully formatted phone number instead of just the country code
    return formattedNumber.toString().trim(); // Trim any trailing spaces
  }


}