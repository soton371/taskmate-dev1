
String? capitalizeFirstLetter(String? word) {
  if (word == null) return null;
  if (word.trim().isEmpty) return null;
  return word[0].toUpperCase() + word.substring(1).toLowerCase();
}

String formatToTwoDigits(String number) {
  return number.toString().padLeft(2, '0');
}




