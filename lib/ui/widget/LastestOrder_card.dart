import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LastOrder extends StatelessWidget {
  final int orderNum;
  LastOrder({this.orderNum});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
             
          Row(
            children: [
              FlatButton(
                      height: 23.0,
                      color: Theme.of(context).primaryColor,
                      shape: StadiumBorder(),
                      onPressed: () {},
                      child: Text(
                        tr('_delivered'),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )),
            ],
          ),
                      ListTile(
                        leading:Text("\$150") ,
                        subtitle: Text(tr('cash_on_delivery')),
                        trailing:Text(tr('_order')+tr('#')+orderNum.toString()) ,

                      )
     
                 
        ],
      ),
    );
  }
}
