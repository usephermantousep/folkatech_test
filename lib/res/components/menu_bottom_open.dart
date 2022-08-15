import 'package:flutter/material.dart';
import 'package:folkatechtest/utils/app_style.dart';

class MenuBottomOpen extends StatelessWidget {
  const MenuBottomOpen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GridView.builder(
        itemCount: 11,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) => SizedBox(
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
        ),
      );
}
