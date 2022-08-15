import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:folkatechtest/data/response/status.dart';
import 'package:folkatechtest/utils/app_style.dart';
import 'package:folkatechtest/utils/routes/routes_name.dart';
import 'package:folkatechtest/utils/utils.dart';
import 'package:folkatechtest/view_model/menu_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<MenuViewModel>(
        create: (BuildContext context) => MenuViewModel(),
        child: Consumer<MenuViewModel>(
          builder: (context, value, child) {
            switch (value.menuResponse.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                return SvgPicture.asset('assets/404.svg');
              case Status.completed:
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                    itemCount: value.menuResponse.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteName.detailMenuPage,
                                arguments: value.menuResponse.data?[index]);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(value.menuResponse
                                                .data?[index].cover ??
                                            ''),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                              ),
                              Expanded(
                                  child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      value.menuResponse.data?[index].name ??
                                          '',
                                      style: GoogleFonts.roboto()
                                          .copyWith(fontSize: 16),
                                    ),
                                    Text(
                                      Utils.formatNumber(
                                        value.menuResponse.data?[index].price
                                                .toString() ??
                                            '',
                                      ),
                                      style: AppStyle.priceStyle,
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    });

              default:
                return Container();
            }
          },
        ),
      );
}
