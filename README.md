# num2persian

`num2persian` is a Dart library for converting numbers to their Persian word equivalents. This can be useful for displaying numbers in a more readable format in Persian-language applications, such as writing out monetary amounts in words.

## Features

- Convert numbers to Persian words.
- Convert numbers to Persian monetary units (Toman, Rial).
- Format numbers with commas.
- Convert numbers to Persian numerals.
- Convert Rial to Toman and vice versa.
- Support for both `int` and `String` types.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  num2persian: ^0.0.3
```

Then, run `flutter pub get` to fetch the package.

## Usage

To use the `num2persian` library, import it in your Dart code:

```dart
import 'package:num2persian/num2persian.dart';
```

### Examples

#### Convert Number to Persian Words

For `String` type:

```dart
String number = "123";
print(number.toPersianLetter()); // Output: یکصد و بیست و سه
```

For `int` type:

```dart
int number = 123;
print(number.toPersianLetter()); // Output: یکصد و بیست و سه
```

#### Convert Number to Persian Monetary Units

To Toman:

```dart
String number = "12345";
print(number.toToman()); // Output: دوازده هزار و سیصد و چهل و پنج تومان
```

To Rial:

```dart
int number = 12345;
print(number.toRial()); // Output: دوازده هزار و سیصد و چهل و پنج ریال
```

#### Format Number with Commas

For `String` type:

```dart
String number = "1234567";
print(number.formatWithCommas()); // Output: 1,234,567
```

For `int` type:

```dart
int number = 1234567;
print(number.formatWithCommas()); // Output: 1,234,567
```

#### Convert Number to Persian Numerals

For `String` type:

```dart
String number = "1234567";
print(number.toPersianNumber()); // Output: ۱۲۳۴۵۶۷
```

For `int` type:

```dart
int number = 1234567;
print(number.toPersianNumberInt()); // Output: ۱۲۳۴۵۶۷
```

#### Convert Rial to Toman

For `String` type:

```dart
String rial = "1234567";
print(rial.rialToToman()); // Output: 123456
```

For `int` type:

```dart
int rial = 1234567;
print(rial.rialToToman()); // Output: 123456
```

#### Convert Toman to Rial

For `String` type:

```dart
String toman = "123456";
print(toman.tomanToRial()); // Output: 1234560
```

For `int` type:

```dart
int toman = 123456;
print(toman.tomanToRial()); // Output: 1234560
```

## Flutter Usage

You can use `num2persian` in your Flutter applications to display numbers in Persian words within your UI components.

### Example Flutter App

Here's a simple example of a Flutter app using `num2persian`:

```dart
import 'package:flutter/material.dart';
import 'package:num2persian/num2persian.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('num2persian Example'),
        ),
        body: Center(
          child: NumberDisplay(),
        ),
      ),
    );
  }
}

class NumberDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String number = "123456";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Number: $number'),
        Text('In Persian: ${number.toPersianLetter()}'),
        Text('As Toman: ${number.toToman()}'),
        Text('As Rial: ${number.toRial()}'),
        Text('With Commas: ${number.formatWithCommas()}'),
        Text('In Persian Numerals: ${number.toPersianNumber()}'),
        Text('Rial to Toman: ${number.rialToToman()}'),
        Text('Toman to Rial: ${number.tomanToRial()}'),
      ],
    );
  }
}
```

This example creates a simple Flutter app with a `NumberDisplay` widget that shows the number in various formats using the `num2persian` library.

## API

### num2persian

#### `String num2Persian(String number)`

Converts a numeric string to its Persian word equivalent.

```dart
String number = "123";
print(num2Persian(number)); // Output: یکصد و بیست و سه
```

### num2persian.PersianNumbers

#### `String toPersianLetter()`

Converts the numeric string to its Persian word equivalent.

```dart
String number = "123";
print(number.toPersianLetter()); // Output: یکصد و بیست و سه
```

#### `String toToman()`

Converts the numeric string to Persian words followed by "تومان".

```dart
String number = "12345";
print(number.toToman()); // Output: دوازده هزار و سیصد و چهل و پنج تومان
```

#### `String toRial()`

Converts the numeric string to Persian words followed by "ریال".

```dart
String number = "12345";
print(number.toRial()); // Output: دوازده هزار و سیصد و چهل و پنج ریال
```

#### `String formatWithCommas()`

Formats the numeric string with commas.

```dart
String number = "1234567";
print(number.formatWithCommas()); // Output: 1,234,567
```

#### `String toPersianNumber()`

Converts the numeric string to Persian numerals.

```dart
String number = "1234567";
print(number.toPersianNumber()); // Output: ۱۲۳۴۵۶۷
```

### Extensions on `int`

#### `String toPersianLetter()`

Converts the integer to its Persian word equivalent.

```dart
int number = 123;
print(number.toPersianLetter()); // Output: یکصد و بیست و سه
```

#### `String toToman()`

Converts the integer to Persian words followed by "تومان".

```dart
int number = 12345;
print(number.toToman()); // Output: دوازده هزار و سیصد و چهل و پنج تومان
```

#### `String toRial()`

Converts the integer to Persian words followed by "ریال".

```dart
int number = 12345;
print(number.toRial()); // Output: دوازده هزار و سیصد و چهل و پنج ریال
```

#### `String toPersianNumberInt()`

Converts the integer to Persian numerals.

```dart
int number = 1234567;
print(number.toPersianNumberInt()); // Output: ۱۲۳۴۵۶۷
```

#### `String formatWithCommas()`

Formats the integer with commas.

```dart
int number = 1234567;
print(number.formatWithCommas()); // Output: 1,234,567
```

#### `String rialToToman()`

Converts the integer from Rial to Toman.

```dart
int rial = 1234567;
print(rial.rialToToman()); // Output: 123456
```

#### `String tomanToRial()`

Converts the integer from Toman to Rial.

```dart
int toman = 123456;
print(toman.tomanToRial()); // Output: 1234560
```

## Contributing

Contributions are welcome! Please submit a pull request or create an issue for any bugs or feature requests.

## License

This project is licensed under the Apache License. See the [LICENSE](LICENSE) file for details.