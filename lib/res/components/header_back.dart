import 'package:flutter/material.dart';
import 'package:folkatechtest/utils/app_style.dart';

class HeaderBack extends StatelessWidget {
  final bool isOpen;
  final void Function() onTap;
  const HeaderBack({Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.red[400],
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: onTap,
                iconSize: 25,
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                )),
            Text(
              'Back',
              style: AppStyle.titleStyle,
            )
          ],
        ),
      );
}
