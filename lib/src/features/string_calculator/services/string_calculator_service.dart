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
    final header = stringToParse.substring(2, stringSeperatorIndex);
    final String stringToProcess = stringToParse.substring(
      stringSeperatorIndex + 1,
    );
     // Regex to find content within brackets, e.g., find "*" and "%" from "[*][%]"
    final delimiterRegex = RegExp(r'\[(.*?)\]');
    final matches = delimiterRegex.allMatches(header);
    if (matches.isEmpty) {
      return _ParseResult(
          delimiter: header, numbersToProcess: stringToProcess);
    }
     // Extract all matched delimiters and escape any special regex characters.
    final delimiters = matches.map((match) {
      return RegExp.escape(match.group(1)!);
    });
 final combinedDelimiterPattern = RegExp(delimiters.join('|'));
    return _ParseResult(
      delimiter: combinedDelimiterPattern,
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
