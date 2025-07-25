import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("StringCalculator", () {
    late StringCalculatorService stringCalculator;
    setUp(() {
      stringCalculator = StringCalculatorService();
    });
    test("Should return 0 when the input string is empty", () {
      const input = "";
      final result = stringCalculator.add(numberString: input);
      expect(result, 0);
    });
    test("Should return the number itself for a single number", () {
      const input = "1";
      final result = stringCalculator.add(numberString: input);
      expect(result, 1);
    });
    test("Should return the sum of two numbers", () {
      const input = "1,5";
      final result = stringCalculator.add(numberString: input);
      expect(result, 6);
    });
    test("Should return the sum of multiple numbers seperated by ,", () {
      const input = "1,5, 8, 10,";
      final result = stringCalculator.add(numberString: input);
      expect(result, 24);
    });
    test("should handle \n as a delimiter between numbers", () {
      const input = "1\n2,3";
      final result = stringCalculator.add(numberString: input);
      expect(result, 6);
    });
    test("should support different delimiters", () {
      const input = "//;\n1;2";
      final result = stringCalculator.add(numberString: input);
      expect(result, 3);
    });
    test(
      "should throw an exception showing all negative numbers in the message",
      () {
        const input = "//;\n1;-2;-4;5";

        expect(
          () => stringCalculator.add(numberString: input),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'message',
              'Exception: negative numbers not allowed: -2, -4',
            ),
          ),
        );
      },
    );

    test("should ignore numbers bigger than 1000", () {
      const input = "//;\n1;2; 1001";
      final result = stringCalculator.add(numberString: input);
      expect(result, 3);
    });

    test(
      "add should support multi-character delimiters specified in brackets",
      () {
        final input = '//[***]\n1***2***3';

        final result = stringCalculator.add(numberString: input);

        expect(result, 6);
      },
    );
test(
      "add should support multiple custom delimiters specified in brackets",
      () {
        final input = '//[*][%]\n1*2%3';

        final result = stringCalculator.add(numberString: input);

        expect(result, 6);
      },
    );

  });
}
