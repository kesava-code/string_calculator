class StringCalculatorService {
  int add({required String numberString}) {
    if (numberString.isEmpty) return 0;

    final List<String> stringNumbers = numberString.split(",");
    int sum = 0;
    for (final stringNumber in stringNumbers) {
      sum += int.parse(stringNumber);
    }
    return sum;
  }
}
