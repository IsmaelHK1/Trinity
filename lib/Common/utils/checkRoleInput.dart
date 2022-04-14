// ignore_for_file: file_names

bool checkRoleInput(String roleInput) {
  bool returnVal = false;
  if (roleInput.toUpperCase() == 'TANK' ||
      roleInput.toUpperCase() == 'HEAL' ||
      roleInput.toUpperCase() == 'DPS') {
    return returnVal = true;
  } else {
    return returnVal;
  }
}
