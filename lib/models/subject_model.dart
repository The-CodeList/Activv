class Subject {
  final String subCode;
  final String? subName;
  final int daysAbsent;
  final int totalDays;

  Subject(
      {required this.subCode,
      required this.daysAbsent,
      this.subName,
      required this.totalDays});
}
