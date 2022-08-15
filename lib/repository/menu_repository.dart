import 'package:folkatechtest/data/network/base_api_services.dart';
import 'package:folkatechtest/data/network/base_api_url.dart';
import 'package:folkatechtest/data/network/network_api_service.dart';
import 'package:folkatechtest/data/response/api_response.dart';
import 'package:folkatechtest/model/menu_model.dart';

//REPOSITORY SERVICE
class MenuRepository {
  final BaseApiServices apiServices = NetworkApiService();

  Future<ApiResponse<List<MenuModel>>> getMenu() async {
    try {
      dynamic response = await apiServices.get(AppUrl.menuUrl, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final data = menuModelFromJson(response);
      return ApiResponse.completed(data);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
