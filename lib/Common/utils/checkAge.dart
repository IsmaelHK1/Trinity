import 'package:intl/intl.dart';

bool isAdult(String birthDateString) {
  bool isMajor = true;
  String datePattern = "dd-MM-yyyy";

  // Current time - at this moment
  DateTime today = DateTime.now();

  // Parsed date to check
  DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

  // Date to check but moved 18 years ahead
  DateTime adultDate = DateTime(
    birthDate.year + 18,
    birthDate.month,
    birthDate.day,
  );

  if (adultDate.year > today.year) {
    return isMajor = false;
  }
  return isMajor;
  ;
}
