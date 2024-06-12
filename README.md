# num2persian
<img src="https://i.ibb.co/28NDFyC/example.gif" width="200" alt="screenshots">


`num2persian` is a Dart library for converting numbers to their Persian word equivalents. This can be useful for displaying numbers in a more readable format in Persian-language applications, such as writing out monetary amounts in words.

## Features

- Convert numbers to Persian words.
- Support for both `int` and `String` types.
- Convert numbers to Persian monetary units (Toman, Rial).
- Format numbers with commas.

## Installation


Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  num2persian: ^0.0.1
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


You can use `num2persian` in your Flutter applications to display numbers in Persian words within your UI components.


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
      ],
    );
  }
}
```

This example creates a simple Flutter app with a `NumberDisplay` widget that shows the number in various formats using the `num2persian` library.

## API

### Extensions on `String`

- `String toPersianLetter()`: Converts the numeric string to its Persian word equivalent.
- `String toToman()`: Converts the numeric string to Persian words followed by "تومان".
- `String toRial()`: Converts the numeric string to Persian words followed by "ریال".
- `String formatWithCommas()`: Formats the numeric string with commas.

### Extensions on `int`

- `String toPersianLetter()`: Converts the integer to its Persian word equivalent.
- `String toToman()`: Converts the integer to Persian words followed by "تومان".
- `String toRial()`: Converts the integer to Persian words followed by "ریال".
- `String formatWithCommas()`: Formats the integer with commas.

## Contributing

Contributions are welcome! Please submit a pull request or create an issue for any bugs or feature requests.

## License

This project is licensed under the Apache License. See the [LICENSE](LICENSE) file for details.