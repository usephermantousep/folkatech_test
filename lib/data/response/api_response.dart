import 'package:folkatechtest/data/response/status.dart';

//CLASS FOR FORMAT RESPONSE API
class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return 'status: $status \ndata: $data\nmessage: $message';
  }
}
