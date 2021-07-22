class StringService {
  static String doubleToString(double db) {
    return db.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
  }

  static bool isDouleDotZero(double db) {
    int i = db.toInt();
    double a = db - i;
    if (a == 0) {
      return true;
    } else
      return false;
  }
}
