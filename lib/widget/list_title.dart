import 'package:flutter/material.dart';
import 'package:taskmanagmenet/style/style.dart';

class ListTileData extends StatelessWidget {
  final Function()? callBack;
  final String titleData;
  final IconData leaddingData;
  const ListTileData(
      {super.key,
      required this.leaddingData,
      this.callBack,
      required this.titleData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leaddingData),
      onTap: callBack,
      title: Text(
        titleData,
        style: Styles.completedTaskStyle,
      ),
    );
  }
}
