class _ParseResult {
  final Pattern delimiter;
  final String numbersToProcess;
  _ParseResult({required this.delimiter, required this.numbersToProcess});
}

class StringCalculatorService {
  int add({required String numberString}) {
    if (numberString.isEmpty) return 0;
    final _ParseResult parseResult = _parseInput(stringToParse: numberString);
    final numbers = parseResult.numbersToProcess
        .split(parseResult.delimiter)
        .where((stringNumber) => stringNumber.trim().isNotEmpty)
        .map((stringNumber) => int.parse(stringNumber.trim()))
        .where((number) => number <= 1000)
        .toList();
    print(numbers);
    _validateNumbers(numbers: numbers);
    return numbers.fold(0, (previousValue, element) => previousValue + element);
  }

  _ParseResult _parseInput({required String stringToParse}) {
    if (!stringToParse.startsWith("//")) {
      return _ParseResult(
        delimiter: RegExp(r'[,\n]'),
        numbersToProcess: stringToParse,
      );
    }

    final stringSeperatorIndex = stringToParse.indexOf('\n');
    final Pattern delimiter = stringToParse.substring(2, stringSeperatorIndex);
    final String stringToProcess = stringToParse.substring(
      stringSeperatorIndex + 1,
    );
    return _ParseResult(
      delimiter: delimiter,
      numbersToProcess: stringToProcess,
    );
  }

  void _validateNumbers({required List<int> numbers}) {
    final negativeNumbers = numbers.where((number) => number < 0);
    if (negativeNumbers.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed: ${negativeNumbers.join(', ')}',
      );
    }
  }
}
