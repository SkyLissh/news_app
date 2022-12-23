import "package:flutter/material.dart";
import "package:intl/intl.dart";

class NewsDate extends StatelessWidget {
  final DateTime date;

  const NewsDate(this.date, {Key? key}) : super(key: key);

  String _formatDate() {
    final today = DateTime.now();

    if (date.difference(today).inDays == 0) {
      return "Today, ${DateFormat.Hm().format(date)}";
    } else if (date.difference(today).inDays == -1) {
      return "Yesterday, ${DateFormat.Hm().format(date)}";
    } else if (date.difference(today).inDays >= -7) {
      return DateFormat.EEEE().format(date);
    } else if (date.year == today.year) {
      return DateFormat.MMMMd().format(date);
    }

    return DateFormat.yMMMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDate(),
      style: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
    );
  }
}
