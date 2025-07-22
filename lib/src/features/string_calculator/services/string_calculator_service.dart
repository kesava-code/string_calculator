class StringCalculatorService {
  int add({required String numberString}) {
    if (numberString.isEmpty) return 0;

    return numberString
        .split(",").where((stringNumber) => stringNumber.isNotEmpty)
        .map((stringNumber) => int.parse(stringNumber))
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
