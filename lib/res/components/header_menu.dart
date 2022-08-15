import 'package:flutter/material.dart';
import 'package:folkatechtest/utils/app_style.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.red[400], borderRadius: BorderRadius.circular(4)),
        child: Text(
          'List Product',
          style: AppStyle.menuTitle.copyWith(fontSize: 20, color: Colors.white),
        ),
      );
}
