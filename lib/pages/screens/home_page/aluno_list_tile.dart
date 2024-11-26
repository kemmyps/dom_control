import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlunoListTile extends StatelessWidget {
  final String title;
  final dynamic subtitle; // Can be String or DateTime
  final Widget leading;
  final String Function(DateTime)? subtitleFormatter;

  const AlunoListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.leading,
    this.subtitleFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: subtitle is DateTime
          ? Text(subtitleFormatter?.call(subtitle) ?? DateFormat('dd/MM/yyyy').format(subtitle))
          : Text(subtitle.toString()),
    );
  }
}