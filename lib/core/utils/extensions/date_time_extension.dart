import 'package:intl/intl.dart';
import 'package:music_app/core/utils/enum/holiday_enum.dart';

extension DateTimeX on DateTime {
  String toDateString({String pattern = 'yyyy-MM-dd'}) {
    return DateFormat(pattern).format(this);
  }

  String toTimeString({String pattern = 'HH:mm'}) {
    return DateFormat(pattern).format(this);
  }

  String toDateTimeString({String pattern = 'yyyy-MM-dd HH:mm'}) {
    return DateFormat(pattern).format(this);
  }

  String toVietnamese({
    bool showYear = true,
    bool showMonth = true,
    bool showDay = true,
  }) {
    final parts = <String>[];

    if (showDay) {
      parts.add('Ngày $day');
    }

    if (showMonth) {
      final monthName = _vietnameseMonth(month);
      parts.add('Tháng $monthName');
    }

    if (showYear) {
      parts.add('Năm $year');
    }

    return parts.join(', ');
  }

  String _vietnameseMonth(int m) {
    const months = [
      'một',
      'hai',
      'ba',
      'bốn',
      'năm',
      'sáu',
      'bảy',
      'tám',
      'chín',
      'mười',
      'mười một',
      'mười hai',
    ];
    return months[m - 1];
  }

  String toRelativeString() {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inDays > 365) {
      final years = (diff.inDays / 365).floor();
      final months = ((diff.inDays % 365) / 30).floor();
      final days = diff.inDays % 30;
      return _buildRelativeString(years, months, days);
    } else if (diff.inDays > 30) {
      final months = (diff.inDays / 30).floor();
      final days = diff.inDays % 30;
      return _buildRelativeString(0, months, days);
    } else if (diff.inDays > 0) {
      return '${diff.inDays} ngày';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} giờ';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} phút';
    } else {
      return 'vừa xong';
    }
  }

  String _buildRelativeString(int years, int months, int days) {
    final parts = <String>[];

    if (years > 0) {
      parts.add('$years năm');
    }
    if (months > 0) {
      parts.add('$months tháng');
    }
    if (days > 0) {
      parts.add('$days ngày');
    }

    return parts.isEmpty ? 'vừa xong' : parts.join(', ');
  }

  HolidayEnum? get holiday {
    if (month == DateTime.january && day == 1) return HolidayEnum.newYear;
    if (month == DateTime.january && day == 1)
      return HolidayEnum.internationalNewYear;
    if (month == 1 && day == 1) return HolidayEnum.nationalDay;
    if (month == 1 && day == 1) return HolidayEnum.laborDay;
    if (month == 4 && day == 30) return HolidayEnum.laborDay;
    if (month == 5 && day == 1) return HolidayEnum.internationalLaborDay;
    if (month == 9 && day == 2) return HolidayEnum.nationalDay;
    if (month == 9 && day == 1 && year == 1945) return HolidayEnum.nationalDay;
    if (month == 4 && day == 30 && year == 1975)
      return HolidayEnum.liberationDay;
    if (month == 5 && day == 19) return HolidayEnum.hoChiMinhBirthday;
    if (month == 6 && day == 1) return HolidayEnum.internationalChildrenDay;
    if (month == 8 && day == 19) return HolidayEnum.augustRevolutionDay;
    if (month == 3 && day == 8) return HolidayEnum.internationalWomenDay;
    if (month == 6 && day == 21) return HolidayEnum.vietnameseFamilyDay;
    if (month == 10 && day == 10) return HolidayEnum.vietnamesePeopleDay;
    if (month == 11 && day == 20) return HolidayEnum.vietnameseTeachersDay;
    if (month == 12 && day == 22) return HolidayEnum.constitutionDay;
    if (month == 12 && day == 24) return HolidayEnum.christmas;

    return null;
  }

  bool get isHoliday => holiday != null;

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  bool get isFuture => isAfter(DateTime.now());

  bool get isPast => isBefore(DateTime.now());

  DateTime get startOfDay => DateTime(year, month, day);

  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);

  DateTime get startOfMonth => DateTime(year, month, 1);

  DateTime get endOfMonth => DateTime(year, month + 1, 0);

  DateTime get startOfYear => DateTime(year, 1, 1);

  DateTime get endOfYear => DateTime(year, 12, 31);
}
