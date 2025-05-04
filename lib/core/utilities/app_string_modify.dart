
String? capitalizeFirstLetter(String? word) {
  if (word == null) return null;
  if (word.trim().isEmpty) return null;
  return word[0].toUpperCase() + word.substring(1).toLowerCase();
}

String formatToTwoDigits(String number) {
  return number.toString().padLeft(2, '0');
}


String? firstLetter(String? name) {
  if (name == null) {
    return null;
  }
  // Check if the name is not empty
  if (name.trim().isNotEmpty) {
    return name.trim().substring(0, 1).toUpperCase();
  }
  return null; // Return empty if the name is empty
}


String? onlyFirstWord(String? name) {
  if (name == null) {
    return null;
  }
  // Check if the name is not empty
  if (name.trim().isNotEmpty) {
    return name.split(' ').first;
  }
  return null; // Return empty if the name is empty
}

