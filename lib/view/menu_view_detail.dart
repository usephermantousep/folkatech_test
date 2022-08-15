import 'package:flutter/material.dart';
import 'package:folkatechtest/model/menu_model.dart';
import 'package:folkatechtest/utils/app_style.dart';
import 'package:folkatechtest/utils/utils.dart';

class MenuViewDetail extends StatelessWidget {
  const MenuViewDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menu = ModalRoute.of(context)?.settings.arguments as MenuModel;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          centerTitle: true,
          title: Text(
            'Detail Product',
            style: AppStyle.titleStyle,
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(menu.cover ?? ''),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.name,
                    style: AppStyle.titleStyle.copyWith(color: Colors.black),
                  ),
                  Text(
                    Utils.formatNumber(menu.price.toString()),
                    style: AppStyle.priceStyle,
                  ),
                  const Divider(),
                  Text(
                    'Description',
                    style: AppStyle.priceStyle,
                  ),
                  Text(
                    menu.desc,
                    textAlign: TextAlign.justify,
                    style: AppStyle.menuTitle,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
