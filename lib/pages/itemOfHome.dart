import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  IconData? icon;

  String? imageIcon;
  String title;
  String? subtitle;
  Color? iconColor;
  Function onPressed;
  HomeItem(
      {Key? key,
        this.imageIcon,
        this.iconColor = Colors.grey,
        this.icon,
        required this.title,
        this.subtitle,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.all(20),
      tileColor: Colors.red,
      leading: icon == null
          ? Image.asset(
        imageIcon ?? "",
        width: 20,
        height: 20,
        fit: BoxFit.cover,
        color: iconColor ?? Colors.grey,
      )
          : Icon(
        icon,
        color: iconColor ?? Colors.grey,
      ),
      title: Text(title, style: const TextStyle(color: Colors.white),),
      subtitle: subtitle != null ? Text(subtitle!, style: const TextStyle(color: Colors.white) ): const SizedBox.shrink(),
      trailing: IconButton(
        onPressed: () => onPressed(),
        splashRadius: 25,
        icon: const Icon(Icons.delete_outline_outlined, color: Colors.white,),
      ),
    );
  }
}
