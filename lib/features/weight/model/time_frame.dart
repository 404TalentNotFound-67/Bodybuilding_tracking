enum TimeFrame { week, month, twoMonths, threeMonths, sixMonths, year, sinceStart }

extension TimeFrameExtension on TimeFrame {
  String get displayString {
    switch (this) {
      case TimeFrame.week:
        return 'Woche';
      case TimeFrame.month:
        return 'Monat';
      case TimeFrame.twoMonths:
        return '2 Monate';
      case TimeFrame.threeMonths:
        return '3 Monate';
      case TimeFrame.sixMonths:
        return '6 Monate';
      case TimeFrame.year:
        return 'Jahr';
      case TimeFrame.sinceStart:
        return 'Seit deinem Anfangsgewicht';
    }
  }
}
