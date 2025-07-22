class StringCalculatorService {
  int add({required String numberString}) {
    if (numberString.isEmpty) return 0;
    final delimiter = RegExp(r'[,\n]');
    return numberString
        .split(delimiter)
        .where((stringNumber) => stringNumber.isNotEmpty)
        .map((stringNumber) => int.parse(stringNumber))
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
