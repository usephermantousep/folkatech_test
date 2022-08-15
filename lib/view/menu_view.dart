import 'dart:async';
import 'package:flutter/material.dart';
import 'package:folkatechtest/res/components/card_menu.dart';
import 'package:folkatechtest/res/components/header_back.dart';
import 'package:folkatechtest/res/components/header_menu.dart';
import 'package:folkatechtest/res/components/menu_bottom_open.dart';
import 'package:folkatechtest/res/components/menu_bootm_closed.dart';
import 'package:folkatechtest/view_model/menu_view_model.dart';
import 'package:provider/provider.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final double _minHeight = 80;
  Offset _offset = const Offset(0, 80);
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: RefreshIndicator(
        onRefresh: () async =>
            Provider.of<MenuViewModel>(context, listen: false).refresh(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 120, top: 50, left: 15, right: 15),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  children: const [
                    //HEADER MENU
                    HeaderMenu(),
                    Expanded(
                      //MENU CARD
                      child: CardMenu(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              //CEK JIKA MENU DIBUKA MUNCUL BACK HEADER
              child: _isOpen
                  ? HeaderBack(isOpen: _isOpen, onTap: _handleClick)
                  : const SizedBox(),
            ),
            AnimatedContainer(
              margin: EdgeInsets.symmetric(
                vertical: _isOpen ? 0 : 20,
                horizontal: _isOpen ? 0 : 10,
              ),
              duration: Duration.zero,
              curve: Curves.easeOut,
              height: _offset.dy + 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10)
                  ]),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: _isOpen
                    ? const Padding(
                        padding: EdgeInsets.all(20.0), child: MenuBottomOpen())
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var i = 0; i < 4; i++) const MenuClosed(),
                        ],
                      ),
              ),
            ),
            Positioned(
              bottom: 2 * _minHeight - _offset.dy + 35,
              child: GestureDetector(
                onTap: _handleClick,
                child: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.orange[500],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10)
                      ]),
                  child: const Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // HANDLE BUKA TUTUP MENU BAWAH
  void _handleClick() {
    double maxHeight = MediaQuery.of(context).size.height - 110;
    _isOpen = !_isOpen;
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (_isOpen) {
        // Menambahkan tinggi
        double value = _offset.dy + 10;
        _offset = Offset(0, value);
        if (_offset.dy > maxHeight) {
          _offset = Offset(0, maxHeight); // Tidak melebihi MAXIMAL TINGGI
          timer.cancel();
        }
      } else {
        // MENGURANGI TINGGI
        double value = _offset.dy - 10;
        _offset = Offset(0, value);
        if (_offset.dy < _minHeight) {
          _offset = Offset(0, _minHeight);
          timer.cancel();
        }
      }
      setState(() {});
    });
  }
}
