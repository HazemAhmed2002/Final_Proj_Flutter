// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
  ListTileDrawer(
      {super.key,
      required this.nav,
      required this.name,
      required this.icon,
      required this.subtitle});
  Function() nav;
  String name;
  String subtitle;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: nav,
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12),
      ),
      leading: icon,
      trailing: const Icon(Icons.arrow_forward_ios),
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }
}
