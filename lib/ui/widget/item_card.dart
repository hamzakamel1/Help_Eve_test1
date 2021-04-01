import 'package:flutter/material.dart';
import 'package:hatilaqi/ui/help_widget.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final Widget icons;
  final GestureTapCallback onTap;

  const ItemCard({
    Key key,
    this.title,
    this.icons,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _color = Colors.black;
//    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Card(
        shape: cardRounded,
        elevation: elevationSmall,
        margin: EdgeInsets.all(paddingBig),
        child: Padding(
          padding: const EdgeInsets.all(marginMin),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              icons,
              SizedBox(width: paddingBig),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(color: _color),
                ),
                fit: FlexFit.tight,
              ),
//          Icon(Icons.arrow_forward_ios, color: _color),
            ],
          ),
        ),
      ),
    );
  }
}
