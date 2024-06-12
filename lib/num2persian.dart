library num2persian;

const String delimiter = ' و ';
const String zero = 'صفر';

const List<List<String>> letters = [
  ['', 'یک', 'دو', 'سه', 'چهار', 'پنج', 'شش', 'هفت', 'هشت', 'نه'],
  ['ده', 'یازده', 'دوازده', 'سیزده', 'چهارده', 'پانزده', 'شانزده', 'هفده', 'هجده', 'نوزده', 'بیست'],
  ['', '', 'بیست', 'سی', 'چهل', 'پنجاه', 'شصت', 'هفتاد', 'هشتاد', 'نود'],
  ['', 'یکصد', 'دویست', 'سیصد', 'چهارصد', 'پانصد', 'ششصد', 'هفتصد', 'هشتصد', 'نهصد'],
  ['', ' هزار', ' میلیون', ' میلیارد', ' بیلیون', ' بیلیارد', ' تریلیون', ' تریلیارد',
    'کوآدریلیون', ' کادریلیارد', ' کوینتیلیون', ' کوانتینیارد', ' سکستیلیون', ' سکستیلیارد', ' سپتیلیون',
    'سپتیلیارد', ' اکتیلیون', ' اکتیلیارد', ' نانیلیون', ' نانیلیارد', ' دسیلیون', ' دسیلیارد'],
];

List<String> prepareNumber(String num) {
  String out = num;
  if (num.length % 3 == 1) {
    out = '00$out';
  } else if (num.length % 3 == 2) {
    out = '0$out';
  }

  RegExp exp = RegExp(r'\d{3}(?=\d)');
  return out.replaceAllMapped(exp, (match) => '${match.group(0)}*').split('*');
}

String threeNumbersToLetter(String num) {
  if (int.parse(num) == 0) {
    return '';
  }
  int parsedInt = int.parse(num);
  if (parsedInt < 10) {
    return letters[0][parsedInt];
  }
  if (parsedInt <= 20) {
    return letters[1][parsedInt - 10];
  }
  if (parsedInt < 100) {
    int one = parsedInt % 10;
    int ten = (parsedInt - one) ~/ 10;
    if (one > 0) {
      return '${letters[2][ten]}$delimiter${letters[0][one]}';
    }
    return letters[2][ten];
  }
  int one = parsedInt % 10;
  int hundreds = (parsedInt - (parsedInt % 100)) ~/ 100;
  int ten = (parsedInt - ((hundreds * 100) + one)) ~/ 10;
  List<String> out = [letters[3][hundreds]];
  int secondPart = ((ten * 10) + one);
  if (secondPart > 0) {
    if (secondPart < 10) {
      out.add(letters[0][secondPart]);
    } else if (secondPart <= 20) {
      out.add(letters[1][secondPart - 10]);
    } else {
      out.add(letters[2][ten]);
      if (one > 0) {
        out.add(letters[0][one]);
      }
    }
  }
  return out.join(delimiter);
}

String num2Persian(String num) {
  if (int.parse(num) == 0) {
    return zero;
  }
  if (num.length > 18) {
    return 'خارج از محدوده';
  }
  List<String> spitedNumber = prepareNumber(num);
  List<String> output = [];
  int splitLength = spitedNumber.length;
  for (int i = 0; i < splitLength; i++) {
    String sectionTitle = letters[4][splitLength - (i + 1)];
    String converted = threeNumbersToLetter(spitedNumber[i]);
    if (converted.isNotEmpty) {
      output.add('$converted$sectionTitle');
    }
  }
  return output.join(delimiter);
}
String formatWithCommasHelper(String num) {
  RegExp exp = RegExp(r'(\d)(?=(\d{3})+(?!\d))');
  return num.replaceAllMapped(exp, (Match match) => '${match.group(1)},');
}

extension PersianNumbers on String {
  String toPersianLetter() {
    return num2Persian(this);
  }

  String toToman() {
    return '${num2Persian(this)} تومان';
  }

  String toRial() {
    return '${num2Persian(this)} ریال';
  }

  String formatWithCommas() {
    return formatWithCommasHelper(this);
  }
}

extension PersianNumbersInt on int {
  String toPersianLetter() {
    return num2Persian(toString());
  }

  String toToman() {
    return '${num2Persian(toString())} تومان';
  }

  String toRial() {
    return '${num2Persian(toString())} ریال';
  }

  String formatWithCommas() {
    return formatWithCommasHelper(toString());
  }
}