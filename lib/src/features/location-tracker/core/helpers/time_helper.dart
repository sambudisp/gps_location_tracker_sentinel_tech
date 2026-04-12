import 'package:intl/intl.dart';

class TimeHelper {
  String duration(int? millis) {
    if (millis == null) return '-';
    final d = Duration(milliseconds: millis);
    final h = d.inHours;
    final m = d.inMinutes % 60;
    final s = d.inSeconds % 60;
    if (h > 0) return '${h}h ${m}m ${s}s';
    if (m > 0) return '${m}m ${s}s';
    return '${s}s';
  }

  String formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String formatDate(String dateString) {
    if (dateString.isEmpty) return '-';

    try {
      final pattern = DateFormat('dd MMM yyyy', 'en');
      final formattedDate = pattern.format(DateTime.parse(dateString).toLocal());
      return formattedDate;
    } catch (e) {
      return dateString;
    }
  }
}
