import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
   ListTileDrawer({super.key, required this.nav, required this.name, required this.icon});
   Function() nav;
   String name;
   Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: nav
      ,
      title:  Text( name, style: const TextStyle(fontSize: 14),),
    //  subtitle: const Text("Go to the profile page"),
      leading: icon,
      trailing: const Icon(Icons.arrow_forward_ios),
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }
}
