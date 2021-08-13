class ApiImportResult {
  int code;
  int records;
  String status;

  ApiImportResult.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        records = json['num_records_imported'],
        status = json["status"];
}