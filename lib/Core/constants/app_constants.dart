import 'package:intl/intl.dart';

import '../services/cache_helper.dart';

class AppConstants {
  static const String logo = "assets/images/logo.png";
  static String baseUrl =
      SharedPref.get(key: "baseUrl") ?? "http://95.216.193.252:600";
  static int empId = SharedPref.get(key: "empId");
  static int whId = SharedPref.get(key: "whId");
  static int printerFormat = SharedPref.get(key: 'printerFormat');
  static double vat = SharedPref.get(key: "vat");
  static String userName = SharedPref.get(key: "userName");
  static int branchID = SharedPref.get(key: "branchID");
  static int ccid = SharedPref.get(key: "ccid");
  static int vatType = SharedPref.get(key: "VATType");

  static String branchName = SharedPref.get(key: "branchName") ?? "";
  static String branchAddress = SharedPref.get(key: "branchAddress") ?? "";
  static String taxNumber = SharedPref.get(key: "taxNumber") ?? "";
  static String notes = SharedPref.get(key: "notes") ?? "";

  static String accessToken = SharedPref.get(key: "accessToken") ?? "";

  static void updateValues() {
    whId = SharedPref.get(key: "whId");
    vat = SharedPref.get(key: "vat");
    userName = SharedPref.get(key: "userName");
    branchID = SharedPref.get(key: "branchID");
    ccid = SharedPref.get(key: "ccid");
    vatType = SharedPref.get(key: "VATType");
    baseUrl = SharedPref.get(key: "baseUrl") ?? "http://95.216.193.252:600";
    accessToken = SharedPref.get(key: "accessToken");
    empId = SharedPref.get(key: "empId");
  }

  static void updateSettingValues() {
    baseUrl = SharedPref.get(key: "baseUrl") ?? "http://95.216.193.252:600";
    branchName = SharedPref.get(key: "branchName") ?? "";
    branchAddress = SharedPref.get(key: "branchAddress") ?? "";
    taxNumber = SharedPref.get(key: "taxNumber") ?? "";
    notes = SharedPref.get(key: "notes") ?? "";
  }

  static String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String local = SharedPref.get(key: 'languageCode') ?? 'ar';
    DateFormat dateFormat = DateFormat('dd/MM/yyyy', local);
    return dateFormat.format(dateTime);
  }
}
