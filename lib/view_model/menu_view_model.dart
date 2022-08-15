import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:folkatechtest/data/response/api_response.dart';
import 'package:folkatechtest/model/menu_model.dart';
import 'package:folkatechtest/repository/menu_repository.dart';
import 'package:folkatechtest/utils/utils.dart';

class MenuViewModel with ChangeNotifier {
  MenuViewModel() {
    getMenu();
  }
  final MenuRepository myRepo = MenuRepository();

  ApiResponse<List<MenuModel>> _menuResponse = ApiResponse.loading();
  ApiResponse<List<MenuModel>> get menuResponse => _menuResponse;

  Future<void> getMenu() async {
    final result = await myRepo
        .getMenu()
        .onError((error, stackTrace) => Utils.toastMessage(error.toString()));
    _menuResponse = result;
    notifyListeners();
  }

  void refresh() {
    _menuResponse = ApiResponse.loading();
    notifyListeners();
    getMenu();
  }
}
