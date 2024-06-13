import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:num2persian/num2persian.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "تبدیل عدد به متن",
              style: GoogleFonts.vazirmatn(),
            ),
          ),
          body: const PersianNumberConverterWidget(),
        ),
      ),
    );
  }
}

class PersianNumberConverterWidget extends StatefulWidget {
  const PersianNumberConverterWidget({super.key});

  @override
  PersianNumberConverterWidgetState createState() =>
      PersianNumberConverterWidgetState();
}

class PersianNumberConverterWidgetState
    extends State<PersianNumberConverterWidget> {
  final TextEditingController _controller = TextEditingController();

  String _persianText = '';

  String _tomanText = '';

  String _rialText = '';

  String _formatWithCommas = '';

  String _persianNumber = '';

  String _rialToToman = '';

  String _tomanToRial = '';

  String _tomanInWords = '';

  String _rialInWords = '';

  void _convertNumber() {
    setState(() {
      if (_controller.text.isEmpty) {
        _formatWithCommas = '';
        _persianText = '';
        _tomanText = '';
        _rialText = '';
        _persianNumber = '';
        _rialToToman = '';
        _tomanToRial = '';
        _tomanInWords = '';
        _rialInWords = '';
      } else {
        String inputNumber = _controller.text;
        _persianText = inputNumber.toPersianLetter();
        _tomanText = inputNumber.toToman();
        _rialText = inputNumber.toRial();
        _formatWithCommas = inputNumber.formatWithCommas();
        _persianNumber = inputNumber.toPersianNumber();
        _rialToToman = inputNumber.rialToToman();
        _tomanToRial = inputNumber.tomanToRial();

        _tomanInWords = _rialToToman.toPersianLetter();
        _rialInWords = _tomanToRial.toPersianLetter();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'عدد را وارد کنید',
                labelStyle: GoogleFonts.vazirmatn(),
              ),
              onChanged: (value) {
                _convertNumber();
              },
            ),
            const SizedBox(height: 20),
            Text(
              _persianText,
              style: GoogleFonts.vazirmatn(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _tomanText,
              style: GoogleFonts.vazirmatn(color: Colors.blue, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _rialText,
              style: GoogleFonts.vazirmatn(color: Colors.amber, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "تبدیل تومان به ریال: $_tomanToRial ریال",
              style: GoogleFonts.vazirmatn(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "تبدیل ریال به تومان: $_rialToToman تومان",
              style: GoogleFonts.vazirmatn(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "تبدیل تومان به ریال: $_rialInWords ریال",
              style: GoogleFonts.vazirmatn(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "تبدیل ریال به تومان: $_tomanInWords تومان",
              style: GoogleFonts.vazirmatn(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _formatWithCommas,
              style: GoogleFonts.vazirmatn(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _persianNumber,
              style: GoogleFonts.vazirmatn(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
