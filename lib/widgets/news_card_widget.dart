import 'package:flutter/material.dart';

class NewsCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  const NewsCardWidget(
      {Key? key,
      this.imageUrl,
      this.title,
      this.subtitle,
      this.icon,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        child: ListTile(
          leading: Card(
            elevation: 10,
            child: Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage("$imageUrl"))),
            ),
          ),
          title: Text("${title ?? ""}"),
          subtitle:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${subtitle ?? ""}"),
            Icon(
              icon,
              color: iconColor == null ? Colors.black : iconColor,
            ),
          ]),
        ),
      ),
    );
  }
}
