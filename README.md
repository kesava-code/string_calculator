# String Calculator Kata in Dart

This repository contains a solution for the String Calculator Kata, implemented in the Dart programming language. The primary focus of this project was not just to solve the problem, but to do so by strictly following professional software development practices, including **Test-Driven Development (TDD)**, **Clean Architecture**, and **SOLID principles**.

---

## Features Implemented

The calculator progressively implements the following features as per the kata's requirements:

1.  **Basic Summation:** Handles an empty string (returns 0), a single number, and multiple comma-separated numbers.
2.  **Newline Delimiters:** Correctly handles `\n` as a valid delimiter in addition to commas (e.g., `"1\n2,3"` returns `6`).
3.  **Negative Number Validation:** Throws a clear, formatted exception if negative numbers are provided (e.g., `"negative numbers not allowed: -2, -4"`).
4.  **Ignore Large Numbers:** Numbers greater than 1000 are ignored in the calculation (e.g., `"2,1001"` returns `2`).
5.  **Custom Delimiter Support:**
    * **Single Character:** Supports a custom delimiter defined in the header (e.g., `"//;\n1;2"`).
    * **Multi-Character:** Supports custom delimiters of any length enclosed in brackets (e.g., `"//[***]\n1***3"`).
    * **Multiple Delimiters:** Supports multiple custom delimiters of any length (e.g., `"//[*][%]\n1*2%3"`).

---

## Technology & Principles

### Tech Stack
* **Language:** **Dart** (Version 3.x)
* **Package Management:** Dart `pub`
* **Testing Framework:** Dart `test` package
* **Version Control:** Git

### Development Methodology
* **Test-Driven Development (TDD):** Every feature was built following the strict **Red-Green-Refactor** cycle. A failing test was written first to define the requirement, followed by the simplest code to make it pass, and finally, the code was refactored for clarity and maintainability. This disciplined approach is reflected in the Git commit history.

* **Clean Architecture:** The project structure is organized by features (`string_calculator`) and layers (`services`), separating business logic from other potential layers like UI or data persistence. This makes the codebase scalable and easy to navigate.

* **SOLID Principles:**
    * **Single Responsibility Principle (SRP):** The `StringCalculatorService` class delegates distinct responsibilities to private helper methods:
        * `_parseInput`: Solely responsible for parsing the input string to extract delimiters and numbers.
        * `_validateNumbers`: Solely responsible for validating the parsed numbers against business rules (e.g., no negatives).
        * `add`: The main method orchestrates the process and performs the final calculation.
    * **Open/Closed Principle:** The design was considered with extension in mind. For instance, the separation of parsing and calculation would make it easy to add new operations (like `multiply`) without significantly altering the parsing logic.

---

## Edge Case Handling

A key focus was to build a robust calculator that gracefully handles edge cases:

* **Empty Input:** An empty string correctly returns `0`.
* **Consecutive/Trailing Delimiters:** Inputs like `"1,,2"` or `"1,2,"` are handled correctly by filtering out empty strings after splitting, preventing `FormatException` crashes.
* **Malformed Delimiter Headers:** The parser is robust enough to handle inputs where the delimiter definition might be incomplete.
* **Special Regex Characters:** When parsing custom delimiters, `RegExp.escape()` is used to ensure that characters with special meaning in Regular Expressions (like `*` or `+`) are treated as literal delimiters.

---

## How to Run the Project

1.  **Clone the repository:**
    ```bash
    git clone <your-repo-url>
    cd string_calculator
    ```

2.  **Get dependencies:**
    ```bash
    dart pub get
    ```

3.  **Run the tests:**
    To verify that all features work as expected, run the test suite.
    ```bash
    dart test
    ```
