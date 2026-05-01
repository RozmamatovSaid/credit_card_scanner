import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;

    text = text.replaceAll(RegExp(r'\D'), '');

    if (text.length > 16) {
      text = text.substring(0, 16);
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }

  static String format(String input) {
    var digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 16) digits = digits.substring(0, 16);

    var buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      var index = i + 1;
      if (index % 4 == 0 && index != digits.length) buffer.write(' ');
    }
    return buffer.toString();
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;

    if (text.isEmpty) {
      return newValue;
    }

    String cleanText = text.replaceAll(RegExp(r'\D'), '');

    if (cleanText.length > 4) {
      cleanText = cleanText.substring(0, 4);
    }

    var buffer = StringBuffer();
    for (int i = 0; i < cleanText.length; i++) {
      buffer.write(cleanText[i]);
      var index = i + 1;
      if (index == 2 && index != cleanText.length) {
        buffer.write('/');
      }
    }

    var result = buffer.toString();

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }

  static String format(String input) {
    if (input.isEmpty) return '';

    String digits = input.replaceAll(RegExp(r'\D'), '');

    if (digits.length >= 2) {
      String month = digits.substring(0, 2);
      String year = digits.substring(2);
      if (year.length > 2) year = year.substring(0, 2);

      return year.isEmpty ? month : "$month/$year";
    }

    return digits;
  }
}
