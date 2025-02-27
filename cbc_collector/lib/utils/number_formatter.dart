import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NumberFormatter {
  static String toLocalizedNumber(AppLocalizations l10n, String number) {
    final Map<String, String> numberMap = {
      '0': l10n.number0,
      '1': l10n.number1,
      '2': l10n.number2,
      '3': l10n.number3,
      '4': l10n.number4,
      '5': l10n.number5,
      '6': l10n.number6,
      '7': l10n.number7,
      '8': l10n.number8,
      '9': l10n.number9,
    };

    return number.split('').map((char) => numberMap[char] ?? char).join('');
  }

  static String toLocalizedNumberWithUnit(AppLocalizations l10n, String number, String unit) {
    final localizedNumber = toLocalizedNumber(l10n, number);
    final localizedUnit = unit == 'kg' ? l10n.kgUnit : unit;
    return l10n.numberWithUnit(localizedNumber, localizedUnit);
  }
} 