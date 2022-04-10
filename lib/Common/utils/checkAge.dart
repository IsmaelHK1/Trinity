import 'package:intl/intl.dart';

bool isAdult(String birthDateString) {
  bool isMajor = true;
  // Applique un pattern défini à la date
  String datePattern = "dd-MM-yyyy";

  // Date Actuelle
  DateTime today = DateTime.now();

  // Parse la date avec le pattern défini
  DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

  // Permet d'augmenter la valeur année de 18
  DateTime adultDate = DateTime(
    birthDate.year + 18,
    birthDate.month,
    birthDate.day,
  );

  // Vérifie si le user est majeur ou non (ne prend en compte que le paramètre de l'année)
  if (adultDate.year > today.year) {
    return isMajor = false;
  }
  return isMajor;
  ;
}
