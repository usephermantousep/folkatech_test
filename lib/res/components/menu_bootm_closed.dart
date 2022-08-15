import 'package:flutter/material.dart';
import 'package:folkatechtest/utils/app_style.dart';

class MenuClosed extends StatelessWidget {
  const MenuClosed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 70,
        width: 70,
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              color: Colors.red,
              child: const Image(
                  image: AssetImage('assets/carts.png'), height: 40),
            ),
            Text(
              'Cart',
              style: AppStyle.menuTitle,
            )
          ],
        ),
      );
}
