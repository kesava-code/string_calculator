class StringCalculatorService {
  int add({required String numberString}) {
    if (numberString.isEmpty) return 0;
    Pattern delimiter = RegExp(r'[,\n]');
    String stringToProcess = numberString;
    if (numberString.startsWith("//")) {
      final stringSeperatorIndex = numberString.indexOf('\n');
      delimiter = numberString.substring(2, stringSeperatorIndex);
      stringToProcess = numberString.substring(
        stringSeperatorIndex + 1,
      );
    }
    return stringToProcess
        .split(delimiter)
        .where((stringNumber) => stringNumber.isNotEmpty)
        .map((stringNumber) => int.parse(stringNumber))
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
